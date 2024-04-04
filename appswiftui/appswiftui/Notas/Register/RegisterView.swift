//
//  RegisterView.swift
//  appswiftui
//
//  Created by Livia Keller on 02/04/24.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var isPresentedAlert: Bool = false
    @State var goNotes: Bool = false
    @State var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack(spacing: 25) {
                Text("Register")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 5)
                    .padding(.bottom, 50)
                
                Group {
                    TextField("", text: $email, prompt: Text("e-mail").foregroundStyle(.white))
                        .keyboardType(.emailAddress)
                    SecureField("", text: $password, prompt: Text("password").foregroundStyle(.white))
                    SecureField("", text: $confirmPassword, prompt: Text("confirm password").foregroundStyle(.white))
                }
                .frame(height: 40)
                .padding(7)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 16).stroke(.cyan ,lineWidth: 2.0)
                })
                .padding(7)
                .foregroundStyle(.white)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                
                Spacer()
                
                Button {
                    registerUser()
                } label: {
                    Text("register")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .bold))
                        .background(isDisabledRegisterButton ? .black.opacity(0.6) : .black)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .disabled(isDisabledRegisterButton)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
        }
        .alert("Attention!", isPresented: $isPresentedAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
        .navigationDestination(isPresented: $goNotes) {
            NotesView()
        }
    }
    
    var isDisabledRegisterButton: Bool {
        return email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    private func registerUser() {
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { result , error in
                if let error {
                    errorMessage = error.localizedDescription
                    isPresentedAlert.toggle()
                } else {
                    goNotes.toggle()
                }
            }
        } else {
            errorMessage = "check password and confirm passaword and try again"
            isPresentedAlert.toggle()
        }
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
}
