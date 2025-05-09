//
//  EnrolmentsByCourseViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation
import OSLog

@Observable @MainActor
class EnrolmentsByCourseViewModel: Observable {
    
    // MARK: Stored properties

    // The list of courses
    var coursesWithStudents: [CourseStudent] = []
    
    // The student we are showing courses for
    var student: Student?
    
    // MARK: Computed properties
    var isFilteredByStudent: Bool {
        // Returns turn when there is a student
        return student != nil
    }
    
    // MARK: Initializer(s)
    init(student: Student? = nil) {
        
        // Store the student we may be filtering on
        self.student = student

        // Refresh data
        self.refresh()
    }
    
    // MARK: Functions
    func refresh() {

        Logger.database.info("EnrolmentsByCourseViewModel: Refreshing...")

        Task {

            // Try to unwrap the potentially nil value
            if let student = student {
                // student is not nil, so...
                // ... get just the courses this student has enrolled in
                try await getCoursesWithStudents(selectedBy: student)
                Logger.database.info("EnrolmentsByCourseViewModel: Got courses available to student \(student.lastName), \(student.firstName) with id \(student.id ?? 0).")
            } else {
                // student is nil, so...
                // ... get all courses from the database
                try await getCoursesWithStudents()
                Logger.database.info("EnrolmentsByCourseViewModel: Got all courses available.")
            }
        }

    }
    
    private func getCoursesWithStudents() async throws {
        
        do {
            let results: [CourseStudent] = try await supabase
                .from("course")
                .select("id, short_code, name, student(id, first_name, last_name)")
                .order("short_code", ascending: true)
                .execute()
                .value

            self.coursesWithStudents = results
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    private func getCoursesWithStudents(selectedBy student: Student) async throws {
        
        do {
            let results: [CourseStudent] = try await supabase
                .from("course")
                .select("id, short_code, name, student!inner(id, first_name, last_name)")
                .eq("student.id", value: student.id)    // Only get courses this student elected to enrol in
                .order("short_code", ascending: true)
                .execute()
                .value

            self.coursesWithStudents = results
            
        } catch {
            debugPrint(error)
        }
        
        
    }
    
}
