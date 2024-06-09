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
        List(viewModel.studentsWithCourses) { student in
            HStack {
                Text("\(student.lastName), \(student.firstName)")
                
                Spacer()
                
                Text("\(student.courses.count)")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Students")
    }
}

#Preview {
    NavigationStack {
        EnrolmentsByStudentView(
            viewModel: EnrolmentsByStudentViewModel()
        )
    }
}
