//
//  CoursesListViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

@Observable
class CoursesListViewModel: Observable {
    
    // MARK: Stored properties
    var courses: [Course] = []
    
    // MARK: Initializer(s)
    init() {
        // Get courses from the database
        Task {
            try await getCourses()
        }
    }
    
    // MARK: Functions
    func getCourses() async throws {
        
        do {
            let results: [Course] = try await supabase
                .from("course")
                .select()
                .execute()
                .value
            
            self.courses = results
            
        } catch {
            debugPrint(error)
        }
        
    }
    
}
