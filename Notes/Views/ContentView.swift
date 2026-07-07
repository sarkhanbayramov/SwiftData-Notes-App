//
//  ContentView.swift
//  Notes
//
//  Created by Sarkhan on 07.07.26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.createdAt, order: .reverse) private var notes: [Note]

    @State private var showingAddNote = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        NoteDetailView(note: note)
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(note.title)
                                    .font(.headline)
                                if note.isImportant {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                }
                            }
                            Text(note.content)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .navigationTitle("Qeydlərim")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddNote = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddNote) {
                AddNoteView()
            }
            .overlay {
                if notes.isEmpty {
                    ContentUnavailableView(
                        "Qeyd yoxdur",
                        systemImage: "note.text",
                        description: Text("Yeni qeyd əlavə etmək üçün + düyməsinə bas")
                    )
                }
            }
        }
    }

    private func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            context.delete(notes[index])
        }
    }
}

#Preview {
    ContentView()
}
