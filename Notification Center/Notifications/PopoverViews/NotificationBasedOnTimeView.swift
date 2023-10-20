//
//  NotificationBasedOnTime.swift
//  Notification Center
//
//  Created by Jakub Klucký on 15.10.2023.
//

import SwiftUI

struct NotificationBasedOnTimeView: View {
    
    @State var currentDate = Date()
    
    var body: some View {
        
        Form{
            
            Section("Pick time and date of the reminder"){
                DatePicker("Reminder",
                           selection: $currentDate,
                           displayedComponents: [.date, .hourAndMinute])
                .pickerStyle(WheelPickerStyle())
    
            }
        }
        .navigationTitle("Select Time")
              
            
        
        
    }
}

struct NotificationBasedOnTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBasedOnTimeView()
    }
}
