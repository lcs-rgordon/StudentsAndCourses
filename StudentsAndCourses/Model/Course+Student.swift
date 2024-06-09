//
//  Course+Student.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

// An instance of this structure stores one course
struct CourseStudent: Identifiable, Codable {
    
    let id: Int
    let shortCode: String
    let name: String
    let students: [Student]             // Holds all the students enrolled in this course
    
    // Help Swift decode information sent from Supabase
    enum CodingKeys: String, CodingKey {
        case id
        case shortCode = "short_code"   // Column is named short_code in the database, not shortCode
        case name
        case students = "student"       // Join is to a table named "student", but we want to place students
                                        // enrolled in this course into an array named "students" as that makes
                                        // our code more readable
    }
    
    // NOTE: Since the existing Student model matches the columns we will get
    //       when joining to that table, we do not need to redefine it here
}
