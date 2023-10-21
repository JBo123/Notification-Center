//
//  NotificationBasedOnTime.swift
//  Notification Center
//
//  Created by Jakub Klucký on 15.10.2023.
//

import SwiftUI

struct NotificationBasedOnTimeView: View {
    
    @State var notificationList: [Notification]
    @State var inputDate = Date()
    @State var title: String = ""
    @State var text: String = ""

    var body: some View {
        
        Form{
            
            Section("Pick time and date of the reminder"){
                DatePicker("Reminder",
                           selection: $inputDate,
                           displayedComponents: [.date, .hourAndMinute])
                .pickerStyle(WheelPickerStyle())
                
                TextField("Title", text: $title)
                    .plainTextField()
                
                TextField("Description", text: $text)
                    .plainTextField()
                
                Button("Add"){
                    
                    notificationList.append(Notification(title: title,
                                                         text: text,
                                                         date: inputDate))
                    
                    saveListOfNotifications(notificationsList: notificationList)
                    
                    NotificationManager.shared.scheduleNotificationByTime(title: title,
                                                                          subtitle: text,
                                                                          timeInterval: inputDate.timeIntervalSinceNow)
                    
                }
    
            }
        }
        .navigationTitle("Select Time")
              
            
        
        
    }
}

struct NotificationBasedOnTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBasedOnTimeView(notificationList: [])
    }
}
