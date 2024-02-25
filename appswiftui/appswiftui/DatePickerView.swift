//
//  DatePickerView.swift
//  appswiftui
//
//  Created by Livia Keller on 25/02/24.
//

import SwiftUI

struct DatePickerView: View {
    
    @State var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 30.0) {
            DatePicker("choose one date", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
            
            Text("the date is: \(formattedDate)")
            
            DatePicker("choose one date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
        }
        .padding()
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: selectedDate)
    }
}

#Preview {
    DatePickerView()
}
