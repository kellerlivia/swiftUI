//
//  ProgressViewScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 26/02/24.
//

import SwiftUI

struct ProgressViewScreen: View {
    
    @State var progress: Double = 0
    var maxValue: Double = 10
    
    var body: some View {
        VStack(spacing: 20.0) {
            Button("advance") {
                progress += 0.5
            }
            
            ProgressView("loading...",
                         value: progress,
                         total: maxValue)
            .labelsHidden()
            .padding()
            
            Button("decrease") {
                startProgress()
            }
        }
        .padding()
    }
    
    func startProgress() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.progress < maxValue {
                progress += 2
            } else {
                timer.invalidate()
                progress = 0
            }
        }
    }
}

#Preview {
    ProgressViewScreen()
}
