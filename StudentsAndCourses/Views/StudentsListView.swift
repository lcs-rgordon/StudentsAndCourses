//
//  StudentsListView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct StudentsListView: View {
    
    // MARK: Stored properties
    @State private var viewModel = StudentsListViewModel()
    
    @State private var isNewStudentSheetShowing = false
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.students) { student in
                    Text("\(student.lastName), \(student.firstName)")
                }
            }
            .sheet(isPresented: $isNewStudentSheetShowing) {
                AddStudentView(isShowing: $isNewStudentSheetShowing)
                    .environment(viewModel) // Must insert view model into environment
                    .presentationDetents([.fraction(0.3)])
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isNewStudentSheetShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .navigationTitle("Students")
        }
    }
}

#Preview {
    StudentsListView()
}
