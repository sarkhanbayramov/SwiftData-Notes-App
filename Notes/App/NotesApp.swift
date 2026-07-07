//
//  NotesApp.swift
//  Notes
//
//  Created by Sarkhan on 07.07.26.
//

import SwiftUI
import SwiftData

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
