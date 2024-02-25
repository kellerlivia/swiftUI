//
//  ToggleScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 25/02/24.
//

import SwiftUI

struct ToggleScreen: View {
    
    @State var isOn: Bool = true
    
    var body: some View {
        ZStack {
            Color(isOn ? .pink : .purple)
                .ignoresSafeArea(.all)
            VStack {
                Toggle(isOn: $isOn, label: {
                    Text("Test")
                })
                .labelsHidden()
            }
            .padding()
        }
    }
}

#Preview {
    ToggleScreen()
}
