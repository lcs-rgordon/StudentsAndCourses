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
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.students) { student in
                    Text("\(student.lastName), \(student.firstName)")
                }
            }
            .navigationTitle("Students")
        }
    }
}

#Preview {
    StudentsListView()
}
