//
//  EnrolmentsByCourseView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct EnrolmentsByCourseView: View {
    
    // MARK: Stored properties
    
    // Provides data to this view
    let viewModel: EnrolmentsByCourseViewModel
    
    // MARK: Computed properties
    var body: some View {
        List(viewModel.coursesWithStudents) { course in
            
            NavigationLink {
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
        .navigationTitle(viewModel.isFilteredByStudent ? "\(viewModel.student!.lastName), \(viewModel.student!.firstName)" : "Courses")
        
    }
}

#Preview {
    NavigationStack {
        EnrolmentsByCourseView(viewModel: EnrolmentsByCourseViewModel())
    }
}
