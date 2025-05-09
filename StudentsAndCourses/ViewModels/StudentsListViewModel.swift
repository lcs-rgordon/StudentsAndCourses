//
//  StudentsListViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

@Observable @MainActor
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
                .order("last_name", ascending: true)    // First order by last name, alphabetically
                .order("first_name", ascending: true)   // Then order by first name, alphabetically
                .execute()                              // e.g.: "Smith, Abe" should come before "Smith, Nathan"
                .value
            
            self.students = results
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    
    func createStudent(firstName: String, lastName: String) {
        
        Task {
            
            // Create the new student
            // NOTE: The id will be nil for now
            let newStudent = Student(
                firstName: firstName,
                lastName: lastName
            )
            
            do {
                // Write the new student to the database
                try await supabase
                    .from("student")
                    .insert(newStudent)
                    .execute()
                
                // Refresh the list of students
                try await self.getStudents()

            } catch {
                debugPrint(error)
            }
            
        }
    }
    
}
