//
//  EnrollmentChangeNotifier.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2025-05-08.
//

import OSLog
import Supabase
import SwiftUI

// NOTE: See these notes on how to set up Postgres Changes in Supabase for the first time
//       https://supabase.com/docs/guides/realtime/postgres-changes?queryGroups=language&language=swift
//
// NOTE: Approach developed here explored through conversation with ChatGPT available here
//
//       https://chatgpt.com/share/681d585b-bcfc-800b-a743-55505e314bff

@Observable @MainActor
class EnrollmentChangeNotifier: Observable {

    // MARK: Stored properties
    
    // Subscribing views will monitor this property
    // and ask their view models to refresh data when
    // it changes
    var changeCount = 0
        
    // Stores a channel to that we will subscribe to
    // and receive realtime updates from
    private var channel: RealtimeChannelV2?
    
    // MARK: Initializer(s)
    init() {
        
        Logger.database.info("EnrollmentChangeNotifier: Initializer is starting.")
        
        // Subscribe to changes
        self.subscribe()
        
    }
    
    // MARK: Function(s)
    func subscribe() {
        
        Logger.database.info("EnrollmentChangeNotifier: About to create channel to receive realtime updates.")

        // Create a channel to that we will subscribe to
        // and receive realtime updates from
        self.channel = supabase.channel("enrollment-updates")
        if let channel = self.channel {

            Logger.database.info("EnrollmentChangeNotifier: Successfully created channel to receive realtime updates.")

            // We are going to observe all changes
            // (insertions, updates, deletions)
            // on any table in the database
            let changeStream = channel.postgresChange(
                AnyAction.self,
                schema: "public"
            )
            
            Task {
                
                // Subscribe to notifications on the channel
                await channel.subscribe()

                Logger.database.info("EnrollmentChangeNotifier: Now subscribed to channel to receive realtime updates.")

                // When a change occurs, run this code block
                for await change in changeStream {
                    
                    Logger.database.info("EnrollmentChangeNotifier: Database changed; incrementing change counter.")

                    // Update the count of changes to tell subscribing views
                    // to ask their view models to update
                    changeCount += 1
                    
                }
                
            }

        } else {
            
            Logger.database.info("EnrollmentChangeNotifier: Unable to create channel to receive realtime updates.")

        }
        
    }
    
    func unsubscribe() {
        Logger.database.info("EnrollmentChangeNotifier: About to unsubscribe from realtime updates channel.")
        Task {
            if let channel = channel {
                await supabase.removeChannel(channel)
                Logger.database.info("EnrollmentChangeNotifier: Successfully unsubscribed from realtime updates channel.")
            } else {
                Logger.database.info("EnrollmentChangeNotifier: Could not unsubscribe from realtime updates channel.")
            }

        }
    }
        
}
