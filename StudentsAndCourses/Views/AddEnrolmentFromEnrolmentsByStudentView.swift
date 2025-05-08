//
//  AddEnrolmentFromEnrolmentsByStudentView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2025-05-07.
//

import SwiftUI

struct AddEnrolmentFromEnrolmentsByStudentView: View {
    
    // MARK: Stored properties
    
    // Is this view showing in a sheet?
    @Binding var isShowing: Bool
    
    // Receive a reference to our view model
    let viewModel: AddEnrolmentFromEnrolmentsbyStudentViewModel
    
    // Stores the selected student
    @State private var selectedStudentId: Int = 0

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Enrol what student?", selection: $selectedStudentId) {
                        ForEach(viewModel.availableStudents) { student in
                            // NOTE: Student data type defines the id
                            //       as an optional. We know the id must
                            //       be defined since we retrieve the list
                            //       of available courses from the database.
                            //       So, it is safe to force unwrap.
                            Text("\(student.lastName), \(student.firstName)").tag(student.id!)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("New Enrolment")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        Task {
                            try await viewModel.saveEnrolment(
                                forStudentWithId: selectedStudentId
                            )
                            isShowing = false
                        }
                    } label: {
                        Text("Enrol")
                    }

                }
            }
        }
    }
}

#Preview {
    
    // Create a view to attach a sheet to
    Text("Example parent view")
        // Present AddEnrolmentFromEnrolmentsByStudentView in a sheet
        .sheet(isPresented: Binding.constant(true)) {
            
            // Show the instance of AddEnrolmentFromStudentView
            // and provide it with an instance of it's view model
            // so it can talk to the database
            AddEnrolmentFromEnrolmentsByStudentView(
                
                isShowing: Binding.constant(true),
                viewModel: AddEnrolmentFromEnrolmentsbyStudentViewModel(
                    availableTo: Course(
                        id: 1,
                        shortCode: "ICS3U",
                        name: "Introduction to Computer Science"
                    )
                )
                
            )
            
        }
}
