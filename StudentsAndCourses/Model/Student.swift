//
//  Student.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

struct Student: Identifiable, Codable {
    
    // MARK: Stored properties
    var id: Int?            // This is an optional since when adding a new course, we won't know the "id" at first
    let firstName: String
    let lastName: String

    // Help Swift encode and decode information sent to/form Supabase
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"     // Column is named first_name in the database, not firstName
        case lastName = "last_name"       // Column is named last_name in the database, not lastName
    }
}
