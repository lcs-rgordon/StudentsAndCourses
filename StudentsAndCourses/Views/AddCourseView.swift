//
//  AddCourseView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct AddCourseView: View {
    // MARK: Stored properties
    
    // Is this view showing in a sheet?
    @Binding var isShowing: Bool
    
    // Access to view model to be able to add a course
    @Environment(CoursesListViewModel.self) var viewModel
    
    // Stores the information for the new course
    @State private var shortCode: String = ""
    @State private var name: String = ""

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Short code, e.g.: MCR3U", text: $shortCode)
                    TextField("Name, e.g.: Functions", text: $name)
                }
            }
            .navigationTitle("New Course")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // Add the course
                        viewModel.createCourse(shortCode: shortCode, name: name)
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
            AddCourseView(isShowing: Binding.constant(true))
                .environment(CoursesListViewModel())
        }
}
