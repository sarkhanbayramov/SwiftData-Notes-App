//
//  AddNoteView.swift
//  Notes
//
//  Created by Sarkhan on 07.07.26.
//

import SwiftUI
import SwiftData


struct AddNoteView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var content = ""
    @State private var isImportant = false
    
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Başlıq",text: $title)
                TextField("Mətn",text: $content,axis: .vertical).lineLimit(4...8)
                Toggle("Vacib",isOn: $isImportant)
            }
            .navigationTitle("Yeni Qeyd")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Ləğv et") { dismiss()}
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Saxla") {
                        let newNote = Note(title: title, content: content,isImportant: isImportant)
                        context.insert(newNote)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddNoteView()
}
