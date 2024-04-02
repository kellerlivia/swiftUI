//
//  ListMoveScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 01/04/24.
//

import SwiftUI

struct ListMoveScreen: View {
    
    @State var items = ["Elemento 1",
                 "Elemento 2",
                 "Elemento 3",
                 "Elemento 4",
                 "Elemento 5",
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { value in
                Text(value).moveDisabled(value == "Elemento 4")
            }
            .onMove(perform: { indices, newOffset in
                items.move(fromOffsets: indices, toOffset: newOffset)
            })
        }
        
//        List($items, id: \.self, editActions: .move) { $value in
//            Text(value)
//        }
    }
}

#Preview {
    ListMoveScreen()
}
