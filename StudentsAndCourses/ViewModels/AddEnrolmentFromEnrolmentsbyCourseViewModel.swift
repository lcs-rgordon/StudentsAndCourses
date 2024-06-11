//
//  AddEnrolmentFromEnrolmentsbyCourseViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-10.
//

import Foundation
import PostgREST

@Observable
class AddEnrolmentFromEnrolmentsbyCourseViewModel: Observable {
    
    // MARK: Stored properties
    
    var availableCourses: [Course] = []
    
    let currentStudent: Student
    
    // MARK: Initializer(s)
    init(availableTo student: Student) {
        
        // Save a reference to the current student
        self.currentStudent = student
        
        // Get courses from the database that the provided student has not yet enroled in
        Task {
            try await getCourses(availableTo: student)
        }
    }
    
    // MARK: Functions
    func getCourses(availableTo student: Student) async throws {
        
        do {
            // Get a list of courses available to the student
            // (the courses they have not already selected)
            let results: [Course] = try await supabase.rpc(
                "get_available_courses",
                params: ["for_student_id": AnyJSON.integer(student.id!)]
              )
              .execute()
              .value
            
            self.availableCourses = results
            dump(self.availableCourses)
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    func saveEnrolment(forCourseWithId courseId: Int) async throws {
        
        // Create the enrolment record
        let newEnrolment = Enrolment(studentId: currentStudent.id!, courseId: courseId)
        
        do {
            // Write the new enrolment to the database
            try await supabase
                .from("enrols_in")
                .insert(newEnrolment)
                .execute()

        } catch {
            debugPrint(error)
        }
        
    }
    
}
