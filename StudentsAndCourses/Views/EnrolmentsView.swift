//
//  EnrolmentsView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct EnrolmentsView: View {
    var body: some View {
        VStack {
            Text("Enrolments")
                .bold()
            Text("This view might show a segmented picker, allowing the user to view enrolments by course, or, by student.")
        }
        .padding()
    }
}

#Preview {
    EnrolmentsView()
}
