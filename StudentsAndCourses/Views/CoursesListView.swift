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
            .navigationTitle("Courses")
        }
    }
}

#Preview {
    CoursesListView()
}
