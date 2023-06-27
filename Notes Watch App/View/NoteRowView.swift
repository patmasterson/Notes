//
//  NoteRowView.swift
//  Notes Watch App
//
//  Created by Patrick Masterson on 10/16/22.
//

import SwiftUI

struct NoteRowView: View {
    let note: Note
    let lineLimit: Int
    
    var body: some View {
        HStack {
            Capsule()
                .frame(width: 4)
                .foregroundColor(.accentColor)
            Text(note.text)
                .lineLimit(lineLimit)
                .padding()
            
        }
    }
}

struct NoteRowView_Previews: PreviewProvider {
    static var note: Note = Note(id: UUID(), text: "Test Row View")
    static var previews: some View {
        NoteRowView(note: note, lineLimit: 1)
    }
}
