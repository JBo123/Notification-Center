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
    @Binding var present: Bool

    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Button("Done")
                {
                    present.toggle()
                }
                .padding([.top, .horizontal])
            }
            
            Form{
                
                Section("Pick time and date of the reminder"){
                    DatePicker("Reminder",
                               selection: $inputDate,
                               in: Date(timeIntervalSinceNow: 20 * 10)...,
                               displayedComponents: [.date, .hourAndMinute])
                    .pickerStyle(WheelPickerStyle())
                    
                    TextField("Title", text: $title)
                        .plainTextField()
                    
                    TextField("Description", text: $text)
                        .plainTextField()
                    
                    Button("Add"){
                        print(inputDate)
                        notificationList = returnListOfNotifications()
                        
                        notificationList.append(Notification(title: title,
                                                             text: text,
                                                             date: inputDate))
                        
                        saveListOfNotifications(notificationsList: notificationList)
                        
                        NotificationManager.shared.scheduleNotificationByTime(title: title,
                                                                              subtitle: text,
                                                                              timeInterval: inputDate.timeIntervalSinceNow)
                        present.toggle() 
                        
                    }
                }
            }
            .navigationTitle("Select Time")
        }
              
            
        
        
    }
}

struct NotificationBasedOnTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBasedOnTimeView(notificationList: [], present: .constant(true))
    }
}
