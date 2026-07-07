//
//  NoteDetailView.swift
//  Notes
//
//  Created by Sarkhan on 07.07.26.
//

import SwiftUI

struct NoteDetailView: View {
    
    @Bindable var note: Note
    
    var body: some View {
        Form{
            TextField("Başlıq",text: $note.title)
            TextField("Mətn",text: $note.content,axis: .vertical).lineLimit(4...8)
            Toggle("Vacib",isOn: $note.isImportant)
        }
        .navigationTitle(note.title)
    }
}
//
//#Preview {
//    NoteDetailView(note: <#Note#>)
//}
