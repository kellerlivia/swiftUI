//
//  Navigation.swift
//  appswiftui
//
//  Created by Livia Keller on 25/02/24.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        NavigationView {
            NavigationLink("go to sreen 02") {
                Screen02()
            }
            .navigationTitle("screen 01")
        }
    }
}

struct Screen02: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20.0){
            Text("screen 02")
            Button("back") {
                dismiss()
            }
        }
        .navigationTitle("screen 02")
    }
}

#Preview {
    Navigation()
}
