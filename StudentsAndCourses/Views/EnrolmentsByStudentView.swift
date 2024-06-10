//
//  EnrolmentsByStudentView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct EnrolmentsByStudentView: View {
    
    // MARK: Stored properties
    let viewModel: EnrolmentsByStudentViewModel
    
    // MARK: Computed properties
    var body: some View {
        VStack(alignment: .leading) {
            
            // When viewing students for a specific course, show the course name
            if viewModel.isFilteredByCourse {
                Text(viewModel.course!.name)
                    .font(.subheadline)
                    .padding(.horizontal)
                
            }
            
            List(viewModel.studentsWithCourses) { student in
                HStack {
                    Text("\(student.lastName), \(student.firstName)")
                    
                    Spacer()

                    // Only show the enrolled course count for a student when not filtering by course
                    if viewModel.isFilteredByCourse == false {
                        Text("\(student.courses.count)")
                            .font(.title2)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        // Show the course code as the navigation title when filtering by a specific course
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
