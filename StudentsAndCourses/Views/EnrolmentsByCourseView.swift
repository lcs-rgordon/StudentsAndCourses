//
//  EnrolmentsByCourseView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct EnrolmentsByCourseView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("ADA3M")
                    .bold()
                Text("Drama")
                    .font(.subheadline)
            }
            VStack(alignment: .leading) {
                Text("AMU3M")
                    .bold()
                Text("Music")
                    .font(.subheadline)
            }
            VStack(alignment: .leading) {
                Text("AVI3M")
                    .bold()
                Text("Visual Arts")
                    .font(.subheadline)
            }
        }
        .navigationTitle("Courses")
    }
}

#Preview {
    NavigationStack {
        EnrolmentsByCourseView()
    }
}
