//
//  EnrolmentsByCourseViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

@Observable
class EnrolmentsByCourseViewModel: Observable {
    
    // MARK: Storied properties
    var coursesWithStudents: [CourseStudent] = []
    
    // MARK: Initializer(s)
    init() {
        // Get all courses from the database, along with their enrolled students
        Task {
            try await getCoursesWithStudents()
        }
    }
    
    // MARK: Functions
    func getCoursesWithStudents() async throws {
        
        do {
            let results: [CourseStudent] = try await supabase
                .from("course")
                .select("id, short_code, name, student(id, first_name, last_name)")
                .execute()
                .value

            self.coursesWithStudents = results
            
        } catch {
            debugPrint(error)
        }
        
    }
}
