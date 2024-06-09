//
//  Student+Course.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

// An instance of this structure stores one student
struct StudentCourse: Identifiable, Codable {
    
    let id: Int
    let firstName: String
    let lastName: String
    let courses: [Course]               // Holds all the courses this student is enrolled in
    
    // Help Swift decode information sent from Supabase
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"   // Column is named first_name in the database, not firstName
        case lastName = "last_name"     // Column is named last_name in the database, not lastName
        case courses = "course"         // Join is to a table named "course", but we want to place courses
                                        // this student enrolled in into an array named "courses" as that makes
                                        // our code more readable
    }
    
    // NOTE: Since the existing Course model matches the columns we will get
    //       when joining to that table, we do not need to redefine it here
}
