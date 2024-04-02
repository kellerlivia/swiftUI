//
//  ListDeleteScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 01/04/24.
//

import SwiftUI

struct ListDeleteScreen: View {
    @State var items = ["Elemento 1",
                 "Elemento 2",
                 "Elemento 3",
                 "Elemento 4",
                 "Elemento 5",
    ]
    
    var body: some View {
//        List {
//            ForEach(items, id: \.self) { value in
//                Text(value)
//                    .deleteDisabled(value == "Elemento 1")
//            }
//            .onDelete(perform: { indexSet in
//                items.remove(atOffsets: indexSet)
//            })
//        }
        
        List($items, id: \.self, editActions: .delete) { $value in
            Text(value)
        }
    }
}

#Preview {
    ListDeleteScreen()
}
