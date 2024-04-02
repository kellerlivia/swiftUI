//
//  FormScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 01/04/24.
//

import SwiftUI

struct FormScreen: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var feedback: String = ""
    @State var nota: Float = 5
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.gray)
                        TextField("nome", text: $name)
                    }
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundStyle(.gray)
                        TextField("email", text: $email)
                            .keyboardType(.emailAddress)
                    }
                } header: {
                    Text("informações pessoais")
                }
                
                Section {
                    ZStack {
                        if feedback.isEmpty {
                            Text("digite seu feedback aqui")
                                .foregroundStyle(.gray)
                        }
                        TextEditor(text: $feedback)
                    }
                } header: {
                    Text("informe seu feedback")
                }
                
                Section {
                    HStack {
                        Text("1")
                        Slider(value: $nota, in: 1...10, step: 1)
                        Text("10")
                        Spacer().frame(width: 20)
                        Text("Nota: \(Int(nota))")
                    }
                } header: {
                    Text("nota")
                }

                Section {
                    Button {
                        print("button")
                    } label: {
                        Text("enviar feedback")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .foregroundColor(.white)
                            .background(isDisabledButton ? .gray : .blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .disabled(isDisabledButton)
                } header: {
                    
                }
            }
        }
    }
    
    var isDisabledButton: Bool {
        return name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    FormScreen()
}
