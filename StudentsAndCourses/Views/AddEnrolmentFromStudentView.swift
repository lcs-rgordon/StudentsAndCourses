//
//  AddEnrolmentFromStudentView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-10.
//

import SwiftUI

struct AddEnrolmentFromStudentView: View {
    
    // MARK: Stored properties
    
    // Is this view showing in a sheet?
    @Binding var isShowing: Bool
    
    // Receive a reference to our view model
    let viewModel: AddEnrolmentFromStudentViewModel
    
    // Stores the selected course
    @State private var selectedCourseId: Int = 0

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Enrol in what course?", selection: $selectedCourseId) {
                        ForEach(viewModel.availableCourses) { course in
                            // NOTE: Course data type defines the id
                            //       as an optional. We know the id must
                            //       be defined since we retrieve the list
                            //       of available courses from the database.
                            //       So, it is safe to force unwrap.
                            Text(course.name).tag(course.id!)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("New Enrolment")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // TODO: Add the enrolment
                        isShowing = false
                    } label: {
                        Text("Enrol")
                    }

                }
            }
        }
    }
}

#Preview {
    Text("Example parent view")
        .sheet(isPresented: Binding.constant(true)) {
            AddEnrolmentFromStudentView(
                isShowing: Binding.constant(
                    true
                ),
                viewModel: AddEnrolmentFromStudentViewModel(
                    availableTo: Student(id: 1, firstName: "", lastName: "")
                )
            )
                
        }
}
