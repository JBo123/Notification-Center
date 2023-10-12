//
//  AddNotificationView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 11.10.2023.
//

import SwiftUI

struct AddNotificationView: View {
    @State var currentDate: Date = Date()
    var closeRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    var body: some View {
        Form{
            Section(header: Text("Pick Date")) {
                DatePicker(
                    "Pick a date:",
                    selection: $currentDate,
                    in: Date()...,
                    displayedComponents: [.hourAndMinute, .date]
                )
            }
        }
    }
}

struct AddNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AddNotificationView()
    }
}
