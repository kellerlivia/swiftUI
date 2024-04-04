//
//  Note.swift
//  appswiftui
//
//  Created by Livia Keller on 03/04/24.
//

import Foundation

struct Note: Identifiable, Equatable, Codable {
    var id: UUID = UUID()
    var title: String = ""
    var content: String = ""
}
