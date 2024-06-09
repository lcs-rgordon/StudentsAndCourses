//
//  EnrolmentsView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct EnrolmentsView: View {
    var body: some View {
        NavigationStack {
            List {

                NavigationLink {
                    EnrolmentsByCourseView(
                        viewModel: EnrolmentsByCourseViewModel()
                    )
                } label: {
                    Text("By course")
                }

                NavigationLink {
                    EnrolmentsByStudentView(
                        viewModel: EnrolmentsByStudentViewModel()
                    )
                } label: {
                    Text("By student")
                }

            }
            .navigationTitle("Enrolments")
        }
    }
}

#Preview {
    EnrolmentsView()
}
