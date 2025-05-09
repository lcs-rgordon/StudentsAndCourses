//
//  Logger.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2025-05-08.
//

import OSLog

extension Logger {
    // Using your bundle identifier is a great way to ensure a unique identifier.
    private static var subsystem = Bundle.main.bundleIdentifier!

    // Logs the view cycles like a view that appeared
    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")

    // All logs related to tracking and analytics
    static let statistics = Logger(subsystem: subsystem, category: "statistics")

    // All logs related to database operations
    static let database = Logger(subsystem: subsystem, category: "database")

    // All logs related to user authentication
    static let authentication = Logger(subsystem: subsystem, category: "authentication")

}

