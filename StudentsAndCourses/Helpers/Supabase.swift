//
//  Supabase.swift
//  StudentsAndCourses
//
//  Created by Russell Gordon on 2024-06-09.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://lugwpbpauaqvxrgihzyl.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx1Z3dwYnBhdWFxdnhyZ2loenlsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY2NjIxODUsImV4cCI6MjA2MjIzODE4NX0.AwMWm4lrIT52caQOMB9kqK5rmHMmZ_ovz719MFo8_ow"
)
