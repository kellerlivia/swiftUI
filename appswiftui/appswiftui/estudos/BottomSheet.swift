//
//  BottomSheet.swift
//  appswiftui
//
//  Created by Livia Keller on 26/03/24.
//

import SwiftUI

struct BottomSheet: View {
    
    @State var presentation: Bool = false
    
    var body: some View {
        VStack {
            Button("exibir tela 02") {
                presentation.toggle()
                
            }
            .sheet(isPresented: $presentation) {
                Text("opaa mundo")
                    .presentationDetents([.medium, .large])
//                    .presentationDetents([.medium)
//                    .presentationDragIndicator(.hidden)
            }
        }
        .padding()
    }
}

#Preview {
    BottomSheet()
}
