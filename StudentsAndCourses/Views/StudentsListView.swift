//
//  StudentsListView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct StudentsListView: View {
    var body: some View {
        VStack {
            Text("Students List")
                .bold()
            Text("This view will show a list of students. Students will be able to be added using a + button from the toolbar, which will show a sheet with the necessary interface to add a course. You will not be able to create enrolments for a student on this screen; that will happen elsewhere in the app.")
        }
        .padding()
    }
}

#Preview {
    StudentsListView()
}
