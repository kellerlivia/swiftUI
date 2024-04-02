//
//  ListViewScreen.swift
//  appswiftui
//
//  Created by Livia Keller on 27/03/24.
//

import SwiftUI

struct ListViewScreen: View {
    var items = ["Elemento 1",
                 "Elemento 2",
                 "Elemento 3",
                 "Elemento 4",
                 "Elemento 5",
    ]
    
    var body: some View {
        //        List {
        //            Text("Elemento 1")
        //            Text("Elemento 2")
        //            Text("Elemento 3")
        //        }
        
        List(items, id: \.self) { value in
            Text(value)
        }
    }
}

#Preview {
    ListViewScreen()
}
