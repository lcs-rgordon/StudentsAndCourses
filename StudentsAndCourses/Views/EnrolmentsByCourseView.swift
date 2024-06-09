//
//  EnrolmentsByCourseView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct EnrolmentsByCourseView: View {
    
    // MARK: Stored properties
    let viewModel: EnrolmentsByCourseViewModel
    
    // MARK: Computed properties
    var body: some View {
        List(viewModel.coursesWithStudents) { course in
            HStack {
                VStack(alignment: .leading) {
                    Text(course.shortCode)
                        .bold()
                    Text(course.name)
                        .font(.subheadline)
                }
                
                Spacer()
                
                Text("\(course.students.count)")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Courses")
    }
}

#Preview {
    NavigationStack {
        EnrolmentsByCourseView(viewModel: EnrolmentsByCourseViewModel())
    }
}
