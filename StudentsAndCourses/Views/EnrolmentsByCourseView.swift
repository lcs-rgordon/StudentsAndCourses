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
            
            NavigationLink {
                // Navigate to enrolments by student
                // IMPORTANT: To limit the enrolments shown on that page,
                //            we pass in the current course information
                //            In this way, only enrolments for that course
                //            are shown.
                EnrolmentsByStudentView(
                    viewModel: EnrolmentsByStudentViewModel(
                        course: Course(
                            id: course.id,
                            shortCode: course.shortCode,
                            name: course.name
                        )
                    )
                )
            } label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text(course.shortCode)
                            .bold()
                        Text(course.name)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    // Only show enrolled students count when not filtering by a student
                    if viewModel.isFilteredByStudent == false {
                        Text("\(course.students.count)")
                            .font(.title2)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        // Show the student name as the navigation title when filtering by a specific student
        .navigationTitle(viewModel.isFilteredByStudent ? "\(viewModel.student!.lastName), \(viewModel.student!.firstName)" : "Courses")
    }
}

#Preview {
    NavigationStack {
        EnrolmentsByCourseView(viewModel: EnrolmentsByCourseViewModel())
    }
}
