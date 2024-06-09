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
    
    func createCourse(shortCode: String, name: String) {
        
        Task {
            
            // Create the new course
            // NOTE: The id will be nil for now
            let newCourse = Course(
                shortCode: shortCode,
                name: name
            )
            
            do {
                // Write the new course to the database
                try await supabase
                    .from("course")
                    .insert(newCourse)
                    .execute()
                
                // Refresh the list of courses
                try await self.getCourses()

            } catch {
                debugPrint(error)
            }
            
        }
    }
    
}
