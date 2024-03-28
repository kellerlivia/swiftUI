//
//  ScrollViewScren.swift
//  appswiftui
//
//  Created by Livia Keller on 27/03/24.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ScrollViewScren: View {
    
    @State var selectedPositionColor: UUID? = nil
    
    var list: [Person] = [
        Person(name: "aa", age: 1),
        Person(name: "bb", age: 2),
        Person(name: "cc", age: 3),
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(0..<25) { index in
                        Text("posicao -> \(index)")
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(.pink)
                    }
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
//                    ForEach(0..<25) { index in
//                        Text("valor -> \(index)")
//                            .frame(height: 45)
//                            .background(selectedPositionColor == index ? .red : .gray)
//                            .onTapGesture {
//                                print("opa")
//                                selectedPositionColor = index
//                            }
//                    }
                    ForEach(list) { person in
                        Text("nome -> \(person.name)")
                            .frame(height: 45)
                            .background(selectedPositionColor == person.id ? .red : .gray)
                            .onTapGesture {
//                                print("opa")
                                selectedPositionColor = person.id
                            }
                    }
                }
            }
            .frame(height: 60)
        }
        .padding()
    }
}

#Preview {
    ScrollViewScren()
}
