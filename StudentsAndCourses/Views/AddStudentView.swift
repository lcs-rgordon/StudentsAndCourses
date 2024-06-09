//
//  AddStudentView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct AddStudentView: View {
    // MARK: Stored properties
    
    // Is this view showing in a sheet?
    @Binding var isShowing: Bool
    
    // Access to view model to be able to add a student
    @Environment(StudentsListViewModel.self) var viewModel
    
    // Stores the information for the new student
    @State private var firstName: String = ""
    @State private var lastName: String = ""

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("First name", text: $firstName)
                    TextField("Last nme", text: $lastName)
                }
            }
            .navigationTitle("New Student")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // Add the student
                        viewModel.createStudent(firstName: firstName, lastName: lastName)
                        // Close this sheet
                        isShowing = false
                    } label: {
                        Text("Add")
                    }

                }
            }
        }
    }
}

#Preview {
    Text("Example parent view")
        .sheet(isPresented: Binding.constant(true)) {
            AddStudentView(isShowing: Binding.constant(true))
                .environment(StudentsListViewModel())
        }
}
