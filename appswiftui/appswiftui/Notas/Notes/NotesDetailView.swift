//
//  NotesDetailView.swift
//  appswiftui
//
//  Created by Livia Keller on 03/04/24.
//

import SwiftUI

struct NotesDetailView: View {
    
    @Binding var note: Note
    @State var noteState: Note
    @Environment(\.dismiss) var dismiss
    
    init(note: Binding<Note>) {
        _note = note
        _noteState = State(initialValue: note.wrappedValue)
    }
    
    var body: some View {
        VStack {
            TextField("Título", text: $noteState.title)
                .font(.title)
            TextEditor(text: $noteState.content)
                .font(.subheadline)
        }
        .padding()
        .navigationTitle("Detalhes")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Salvar") {
                    note = noteState
                    dismiss()
                }
                .disabled(isEqualNotes)
            }
        }
    }
    
    var isEqualNotes: Bool {
        note == noteState
    }
}

#Preview {
    @State var note = Note(title: "estudar iOS", content: "curso de SwiftUI, Vision, mobile iOS, curso de SwiftUI, Vision, mobile iOS")
    return NavigationStack {
        NotesDetailView(note: $note)
    }
}
