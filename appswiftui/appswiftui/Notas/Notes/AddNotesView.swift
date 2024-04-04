//
//  AddNotesView.swift
//  appswiftui
//
//  Created by Livia Keller on 03/04/24.
//

import SwiftUI

struct AddNotesView: View {
    
    @ObservedObject var viewModel: NoteViewModel
    @State var note = Note()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("informe o título", text: $note.title)
            } header: {
                Text("título")
            }
            
            Section {
                TextEditor(text: $note.content)
            } header: {
                Text("conteúdo")
            }
            
            Section {
                Button("salvar") {
                    viewModel.notes.append(note)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let viewModel = NoteViewModel()
    return AddNotesView(viewModel: viewModel)
}
