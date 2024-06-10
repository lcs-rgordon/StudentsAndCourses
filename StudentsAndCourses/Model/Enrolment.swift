//
//  Enrolment.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-10.
//

import Foundation

// This models an enrolment by one student in one course
// NOTE: Will be written to the "enrols_in" table in the database
struct Enrolment: Codable {
    
    // MARK: Stored properties
    let studentId: Int
    let courseId: Int

    // Help Swift encode and decode information sent to/from Supabase
    enum CodingKeys: String, CodingKey {
        case studentId = "student_id"   // Column is named student_id in the database, not studentId
        case courseId = "course_id"     // Column is named course_id in the database, not courseId
    }
    
}
