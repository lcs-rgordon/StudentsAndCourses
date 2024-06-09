//
//  CoursesListView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct CoursesListView: View {
    var body: some View {
        VStack {
            Text("Courses List")
                .bold()
            Text("This view will show a list of courses. Courses will be able to be added using a + button from the toolbar, which will show a sheet with the necessary interface to add a course.")
        }
        .padding()
    }
}

#Preview {
    CoursesListView()
}
