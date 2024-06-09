//
//  Course.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation

struct Course: Identifiable, Codable {
    
    // MARK: Stored properties
    var id: Int?            // This is an optional since when adding a new course, we won't know the "id" at first
    let shortCode: String
    let name: String

    // Help Swift encode and decode information sent to/form Supabase
    enum CodingKeys: String, CodingKey {
        case id
        case shortCode = "short_code"   // Column is named short_code in the database, not shortCode
        case name
    }
}
