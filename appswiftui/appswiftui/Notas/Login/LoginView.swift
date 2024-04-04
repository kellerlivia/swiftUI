//
//  LoginScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 02/04/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var goRegister: Bool = false
    @State var goNotes: Bool = false
    @State var errorMessage: String = ""
    @State var isPresentedAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.ignoresSafeArea()
                VStack(spacing: 25) {
                    Text("Login")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    Group {
                        TextField("", text: $email, prompt: Text("e-mail").foregroundStyle(.white))
                            .keyboardType(.emailAddress)
                        SecureField("", text: $password, prompt: Text("password").foregroundStyle(.white))
                    }
                    .frame(height: 40)
                    .padding(7)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 16).stroke(.cyan ,lineWidth: 3.0)
                    })
                    .padding(7)
                    .foregroundStyle(.white)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    
                    Spacer()
                    
                    Button {
                        loginUser()
                    } label: {
                        Text("login")
                            .frame(width: 210, height: 45)
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .bold))
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    Spacer()
                    
                    Button {
                        goRegister.toggle()
                    } label: {
                        Text("não tem conta? Registre-se")
                            .frame(height: 45)
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
            }
            .alert("Attention!", isPresented: $isPresentedAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            .navigationDestination(isPresented: $goRegister) {
                RegisterView()
            }
            .navigationDestination(isPresented: $goNotes) {
                NotesView()
            }
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                errorMessage = error.localizedDescription
                isPresentedAlert.toggle()
            } else {
                goNotes.toggle()
            }
        }
        email = ""
        password = ""
    }
}

#Preview {
    LoginView()
}
