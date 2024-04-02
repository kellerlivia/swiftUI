//
//  ListObjc.swift
//  appswiftui
//
//  Created by Livia Keller on 27/03/24.
//

import SwiftUI

struct PersonList: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

struct ListObjc: View {
    
    var listPerson = [
        PersonList(name: "livia"),
        PersonList(name: "git"),
        PersonList(name: "iOS")
    ]
    
    var body: some View {
        //        List(listPerson) { person in
        //            Text(person.name)
        //                .background(Color.red)
        //                .listRowBackground(Color.blue)
        //        }
        
        List {
            ForEach(listPerson) { person in
                Text(person.name)
            }
//            .background(Color.red)
            .listRowBackground(Color.blue)
            
            Button("Olá mundo") {
                print("Action Button")
            }
        }
    }
}

#Preview {
    ListObjc()
}
