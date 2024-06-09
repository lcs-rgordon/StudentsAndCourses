//
//  LandingView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        TabView {
            
            EnrolmentsView()
                .tabItem {
                    Label(
                        "Enrolments",
                        systemImage: "rectangle.inset.filled.and.person.filled"
                    )
                }
            
            CoursesListView()
                .tabItem {
                    Label(
                        "Courses",
                        systemImage: "rectangle.inset.filled"
                    )
                }
            
            StudentsListView()
                .tabItem {
                    Label(
                        "Students",
                        systemImage: "person.fill"
                    )
                }

        }
    }
}

#Preview {
    LandingView()
}
