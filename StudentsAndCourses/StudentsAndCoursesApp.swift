//
//  StudentsAndCoursesApp.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

@main
struct StudentsAndCoursesApp: App {
    
    // MARK: Stored properties
    
    // Used to see changes to the database
    @State private var changeNotifier = EnrollmentChangeNotifier()
    
    // Allows for tracking when app is backgrounded or foregrounded
    @Environment(\.scenePhase) var scenePhase
    
    // MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environment(changeNotifier)
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            switch newPhase {
            case .background:
                // To conserve server resources, tell the database
                // that we no longer want to receive updates about
                // database changes
                changeNotifier.unsubscribe()
            case .active:
                // When the app is active again, we need to be able
                // to know when the database has changed
                changeNotifier.subscribe()
            default: break
            }
        }
    }
}
