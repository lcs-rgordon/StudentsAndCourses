//
//  EnrolmentsByStudentView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct EnrolmentsByStudentView: View {
    var body: some View {
        List {
            Text("Barbour, Nick")
            Text("Cho, Emily")
            Text("Doe, John")
        }
        .navigationTitle("Students")
    }
}

#Preview {
    NavigationStack {
        EnrolmentsByStudentView()
    }
}
