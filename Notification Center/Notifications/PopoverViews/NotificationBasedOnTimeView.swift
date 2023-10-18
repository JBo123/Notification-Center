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
            
            Section("Pick a date"){
                DatePicker("When be reminded",
                           selection: $currentDate,
                           displayedComponents: [.date, .hourAndMinute])
                .pickerStyle(WheelPickerStyle())
            }
        }
              
            
        
        
    }
}

struct NotificationBasedOnTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBasedOnTimeView()
    }
}
