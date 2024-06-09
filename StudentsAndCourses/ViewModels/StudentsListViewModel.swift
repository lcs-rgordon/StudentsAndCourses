//
//  StudentsListViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

@Observable
class StudentsListViewModel: Observable {
    
    // MARK: Stored properties
    var students: [Student] = []
    
    // MARK: Initializer(s)
    init() {
        // Get students from the database
        Task {
            try await getStudents()
        }
    }
    
    // MARK: Functions
    func getStudents() async throws {
        
        do {
            let results: [Student] = try await supabase
                .from("student")
                .select()
                .execute()
                .value
            
            self.students = results
            
        } catch {
            debugPrint(error)
        }
        
    }
    
}
