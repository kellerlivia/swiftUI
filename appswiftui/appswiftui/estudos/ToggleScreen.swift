//
//  ToggleScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 25/02/24.
//

import SwiftUI

struct ToggleScreen: View {
    
    @State var isOn: Bool = true
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            Color(isOn ? .pink : .purple)
                .ignoresSafeArea(.all)
            VStack(spacing: 20.0) {
                Toggle(isOn: $isOn, label: {
                    Text("Test")
                })
                .labelsHidden()
                
                Stepper("contador",
                        value: $count,
                        in: 0...10,
                        step: 2)
                .labelsHidden()
                
                Text("value: \(count)")
            }
            .padding()
        }
    }
}

#Preview {
    ToggleScreen()
}
