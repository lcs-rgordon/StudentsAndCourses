//
//  EnrolmentsByStudentView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct EnrolmentsByStudentView: View {
    
    // MARK: Stored properties
    
    // Provides data to this view
    let viewModel: EnrolmentsByStudentViewModel
    
    // MARK: Computed properties
    var body: some View {
        VStack(alignment: .leading) {
            
            if viewModel.isFilteredByCourse {
                Text(viewModel.course!.name)
                    .font(.subheadline)
                    .padding(.horizontal)
                
            }
            
            List(viewModel.studentsWithCourses) { student in
                
                NavigationLink {
                    EnrolmentsByCourseView(
                        viewModel: EnrolmentsByCourseViewModel(
                            student: Student(
                                id: student.id,
                                firstName: student.firstName,
                                lastName: student.lastName
                            )
                        )
                    )
                } label: {
                    HStack {
                        Text("\(student.lastName), \(student.firstName)")
                        
                        Spacer()

                        // Only show course count for a student when not filtering by course
                        if viewModel.isFilteredByCourse == false {
                            Text("\(student.courses.count)")
                                .font(.title2)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }

                }
            }
        }
        .navigationTitle(viewModel.isFilteredByCourse ? viewModel.course!.shortCode : "Students")
    }
}

#Preview {
    NavigationStack {
        EnrolmentsByStudentView(
            viewModel: EnrolmentsByStudentViewModel()
        )
    }
}
