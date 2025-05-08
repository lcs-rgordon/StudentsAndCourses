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
    
    // Are we showing the sheet to add an enrolment for a course?
    @State private var isAddEnrolmentSheetShowing = false
    
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
        }
        .toolbar {
            // Only show the button when seeing students in a
            // specific course
            if viewModel.isFilteredByCourse {
                Button {
                    isAddEnrolmentSheetShowing = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isAddEnrolmentSheetShowing, onDismiss: {
            
            // Refresh the list of students after adding a new course
            Task {
                try await viewModel.getStudentsWithCourses(enrolledIn: viewModel.course!)
            }
            
        }) {
            // Show the interface to add a course
            AddEnrolmentFromEnrolmentsByStudentView(
                isShowing: $isAddEnrolmentSheetShowing,
                viewModel: AddEnrolmentFromEnrolmentsbyStudentViewModel(availableTo: viewModel.course!)
            )
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
