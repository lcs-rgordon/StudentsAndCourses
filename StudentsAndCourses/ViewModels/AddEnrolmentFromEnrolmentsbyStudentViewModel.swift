//
//  AddEnrolmentFromEnrolmentsbyStudentViewModel.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2025-05-07.
//

import Foundation
import PostgREST

@Observable @MainActor
class AddEnrolmentFromEnrolmentsbyStudentViewModel: Observable {
    
    // MARK: Stored properties
    
    var availableStudents: [Student] = []
    
    let currentCourse: Course
    
    // MARK: Initializer(s)
    init(availableTo course: Course) {
        
        // Save a reference to the current course
        self.currentCourse = course
        
        // Get students from the database that are not enrolled in the provided course
        Task {
            try await getStudents(availableTo: course)
        }
    }
    
    // MARK: Functions
    func getStudents(availableTo course: Course) async throws {
        
        do {
            // Get a list of students available to the course
            // (the students not already enrolled in this course)
            let results: [Student] = try await supabase.rpc(
                "get_available_students",
                params: ["for_course_id": AnyJSON.integer(course.id!)]
              )
              .execute()
              .value
            
            self.availableStudents = results
            dump(self.availableStudents)
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    func saveEnrolment(forStudentWithId studentId: Int) async throws {
        
        // Create the enrolment record
        let newEnrolment = Enrolment(studentId: studentId, courseId: currentCourse.id!)
        
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
