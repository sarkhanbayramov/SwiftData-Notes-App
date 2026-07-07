//
//  Note.swift
//  Notes
//
//  Created by Sarkhan on 07.07.26.
//

import Foundation
import SwiftData

@Model
final class Note {
    
    var title: String
    var content: String
    var createdAt: Date
    var isImportant: Bool
    
    init(title: String, content: String, createdAt: Date = .now, isImportant: Bool) {
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.isImportant = isImportant
    }
    
}
