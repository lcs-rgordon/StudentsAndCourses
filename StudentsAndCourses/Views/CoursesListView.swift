//
//  CoursesListView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct CoursesListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    VStack(alignment: .leading) {
                        Text("ENG3U")
                            .bold()
                        Text("English")
                            .font(.subheadline)
                    }
                    VStack(alignment: .leading) {
                        Text("ICS3U")
                            .bold()
                        Text("Introduction to Computer Science")
                            .font(.subheadline)
                    }
                    VStack(alignment: .leading) {
                        Text("MCR3U")
                            .bold()
                        Text("Functions")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Courses")
        }
    }
}

#Preview {
    CoursesListView()
}
