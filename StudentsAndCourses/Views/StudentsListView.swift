//
//  StudentsListView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import SwiftUI

struct StudentsListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Text("Barbour, Nick")
                    Text("Cho, Emily")
                    Text("Haberman, Jamie")
                }
                
            }
            .navigationTitle("Students")
        }
    }
}

#Preview {
    StudentsListView()
}
