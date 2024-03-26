//
//  ContentView.swift
//  appswiftui
//
//  Created by Livia Keller on 21/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 15.0) {
                Text("Login")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold))
//                Image("logo")
                
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                
                TextField("digite seu email:", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.black)
                    .keyboardType(.emailAddress)
                
                SecureField("digite sua senha:", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.black)
                    .keyboardType(.default)
                
                Button(action: {
                    print("botao clicado")
                    isPresented.toggle()
                }, label: {
                    Text("login")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .background(.pink)
                        .cornerRadius(8)
                })
//                .sheet(isPresented: $isPresented, content: {
//                    SheetView()
//                })
                .fullScreenCover(isPresented: $isPresented, content: {
                    SheetView()
                })
                
                HStack {
                    Text("nao tem conta?")
                        .foregroundStyle(.white)
                    Button(action: {
                        print("botao cadastre-se clicado")
                    }, label: {
                        Text("cadastre-se")
                            .foregroundColor(.pink)
                            .font(.system(size: 18, weight: .semibold))
                    })
                }
                
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal, 20.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SheetView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea(.all)
            VStack {
                Text("new screen")
                Button("back") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
