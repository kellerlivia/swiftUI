//
//  TabViewScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 26/03/24.
//

import SwiftUI

struct TabViewScreen: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Text("conteudo primeira tela")
                .tabItem {
                    if selection == 0 {
                        Image(systemName: "1.circle")
                    } else {
                        Image(systemName: "book.fill")
                    }
                    Text("primeira tela")
                }
                .tag(0)
            Text("conteudo segunda tela")
                .tabItem {
//                    Label("", image: "")
                    Image(systemName: "2.circle")
                    Text("segunda tela")
                }
                .tag(1)
        }
        .tint(.red)
    }
}

#Preview {
    TabViewScreen()
}
