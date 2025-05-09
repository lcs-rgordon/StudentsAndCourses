//
//  EnrolmentsView.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import OSLog
import SwiftUI

struct EnrolmentsView: View {
    
    // MARK: Stored properties
    
    // Gain access to the shared change notifier so we can tell when
    // a refresh of data on this view is required
    @Environment(EnrollmentChangeNotifier.self) private var changeNotifier

    // Create view models for each type of enrolment perspective
    @State private var enrolmentsByCourseViewModel = EnrolmentsByCourseViewModel()
    @State private var enrolmentsByStudentViewModel = EnrolmentsByStudentViewModel()
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List {

                NavigationLink {
                    EnrolmentsByCourseView(
                        viewModel: enrolmentsByCourseViewModel
                    )
                } label: {
                    Text("By course")
                }

                NavigationLink {
                    EnrolmentsByStudentView(
                        viewModel: enrolmentsByStudentViewModel
                    )
                } label: {
                    Text("By student")
                }

            }
            .onChange(of: changeNotifier.changeCount) {

                Logger.viewCycle.info("EnrolmentsView: Database change observed; updating view models.")
                
                enrolmentsByCourseViewModel.refresh()
                enrolmentsByStudentViewModel.refresh()
                
            }
            .navigationTitle("Enrolments")
        }
    }
}

#Preview {
    EnrolmentsView()
}
