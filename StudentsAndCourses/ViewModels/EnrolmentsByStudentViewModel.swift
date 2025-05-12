//
//  EnrolmentsByStudentViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

@Observable @MainActor
class EnrolmentsByStudentViewModel: Observable {
    
    // MARK: Stored properties
    
    // The list of students
    var studentsWithCourses: [StudentCourse] = []
    
    // The course enrolled students are being shown for
    var course: Course?
    
    // MARK: Computed properties
    var isFilteredByCourse: Bool {
        // Returns true when there is a course
        return course != nil
    }
    
    // MARK: Initializer(s)
    init(course: Course? = nil) {
        
        // Store the course we may be filtering on
        self.course = course
        
        Task {
            // Try to unwrap the potentially nil value
            if let course = course {
                // course is not nil, so...
                // ... get just the students enrolled in the provided course
                try await getStudentsWithCourses(enrolledIn: course)
            } else {
                // course is nil, so...
                // ... get all students from the database
                try await getStudentsWithCourses()
            }
        }
    }
    
    // MARK: Functions
    func getStudentsWithCourses() async throws {
        
        do {
            let results: [StudentCourse] = try await supabase
                .from("student")
                .select("id, first_name, last_name, course(id, short_code, name)")
                .order("last_name", ascending: true)    // First order by last name, alphabetically
                .order("first_name", ascending: true)   // Then order by first name, alphabetically
                .execute()                              // e.g.: "Smith, Abe" should come before "Smith, Nathan"
                .value

            self.studentsWithCourses = results
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    func getStudentsWithCourses(enrolledIn course: Course) async throws {
        
        do {
            let results: [StudentCourse] = try await supabase
                .from("student")
                .select("id, first_name, last_name, course!inner(id, short_code, name)")
                .eq("course.id", value: course.id)        // Only select students enrolled in provided course
                .order("last_name", ascending: true)      // First order by last name, alphabetically
                .order("first_name", ascending: true)     // Then order by first name, alphabetically
                .execute()                                // e.g.: "Smith, Abe" should come before "Smith, Nathan"
                .value

            self.studentsWithCourses = results
            
        } catch {
            debugPrint(error)
        }
        
    }

}
