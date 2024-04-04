//
//  NotesView.swift
//  appswiftui
//
//  Created by Livia Keller on 02/04/24.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NoteViewModel()
    @State var isGoAddNote: Bool = false
    
    var body: some View {
        List($viewModel.notes, editActions: .all) { $note in
            NavigationLink {
                NotesDetailView(note: $note)
            } label: {
                HStack {
                    Image(systemName: "pencil")
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 8)
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.headline)
                        Text(note.content)
                            .font(.subheadline)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("notas")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("adicionar") {
                    isGoAddNote.toggle()
                }
            }
        }
        .sheet(isPresented: $isGoAddNote, content: {
            AddNotesView(viewModel: viewModel)
        })
    }
}

// @ObservedObject é usado em uma View para reagir a mudanças em um ObservableObject.

// @StateObject é similar a @ObservedObject, mas é responsável pela criação e destruição do objeto observado, sendo mais apropriado para objetos que a view deve possuir.

// @Published é utilizado para notificar mudanças em propriedades de um ObservableObject.

#Preview {
    NavigationStack {
        NotesView()
    }
}
