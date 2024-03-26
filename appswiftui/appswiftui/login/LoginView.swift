//
//  LoginView.swift
//  appswiftui
//
//  Created by Livia Keller on 27/02/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
            
                VStack {
                    Text("login")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
//                    Group {
//                        TextField("digite seu email", text: $email, prompt: Text("email").foregroundStyle(.white))
//                    }
//                    .frame(height: 40)
//                    .foregroundStyle(.white)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    LoginView()
}
