//
//  CoursesListView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct CoursesListView: View {
    
    // MARK: Stored properties
    @State private var viewModel = CoursesListViewModel()
    
    @State private var isNewCourseSheetShowing = false
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.courses) { course in
                    VStack(alignment: .leading) {
                        Text(course.shortCode)
                            .bold()
                        Text(course.name)
                            .font(.subheadline)
                    }
                }
            }
            .sheet(isPresented: $isNewCourseSheetShowing) {
                AddCourseView(isShowing: $isNewCourseSheetShowing)
                    .environment(viewModel) // Must insert view model into environment
                    .presentationDetents([.fraction(0.3)])
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isNewCourseSheetShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .navigationTitle("Courses")
        }
    }
}

#Preview {
    CoursesListView()
}
