//
//  EnrolmentsByStudentViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

@Observable
class EnrolmentsByStudentViewModel: Observable {
    
    // MARK: Storied properties
    var studentsWithCourses: [StudentCourse] = []
    
    // MARK: Initializer(s)
    init() {
        // Get all students from the database, along with the courses they enrolled in
        Task {
            try await getStudentsWithCourses()
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
}
