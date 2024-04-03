//
//  ListSection.swift
//  appswiftui
//
//  Created by Livia Keller on 01/04/24.
//

import SwiftUI

struct ListSection: View {
    var body: some View {
        List {
            Group {
                Section {
                    Text("primeira section")
                }
                
                Section {
                    Text("segunda section")
                }
                
                Section("terceira section") {
                    Text("terceira section")
                    Text("terceira section")
                    Text("terceira section")
                    Text("terceira section")
                }
                
                Section {
                    Text("quarta section")
                    Text("quarta section")
                    Text("quarta section")
                    Text("quarta section")
                } header: {
                    HeaderView()
                }
            }
//            .listRowSeparator(.hidden)
            .headerProminence(.increased)
            
        }
//        .listStyle(.plain)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 20.0) {
            Image(systemName: "star")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.pink)
            VStack(alignment: .leading) {
                Text("Livia")
                Text("Developer")
            }
        }
    }
}

#Preview {
    ListSection()
}
