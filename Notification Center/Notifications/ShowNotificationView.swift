//
//  ShowNotificationView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 09.10.2023.
//

import SwiftUI

struct ShowNotificationView: View {
    
    let expireDate: Date = Date()
    @State var notificationList: [Notification]

    init(notificationList: [Notification]) {
        self._notificationList = State(initialValue: notificationList)
    }
    
    var body: some View {
       
        NavigationView{
            List {//(notificationList) { notification in
                
                ForEach(notificationList){ notification in
                    VStack(spacing: -5){
                        HStack{
                            VStack{
                                Text(notification.title)
                                    .font(.title2)
                                Text(notification.text)
                                    .font(.callout)
                            }
                            CircleTimerView(secondsToNotify: notification.secondsToNotify)
                            
                        }
                        
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    deleteFromListOfNotifications(notificationList: notificationList, indexSet: indexSet)
                })
                .onAppear(){
                    //notificationList = returnListOfNotifications()
                }
            }
        }
    }
}

struct ShowNotificationView_Previews: PreviewProvider {
    
   
    static var previews: some View {
        ShowNotificationView(notificationList: [
            Notification(title: "1", date: Date(timeIntervalSinceNow: 600 * 60 * 24)),
            Notification(title: "2", date: Date(timeIntervalSinceNow: 600 * 60 * 24)),
            Notification(title: "3", date: Date(timeIntervalSinceNow: 600 * 60 * 24)),
            Notification(title: "4", date: Date(timeIntervalSinceNow: 600 * 60 * 24)),
            Notification(title: "5", date: Date(timeIntervalSinceNow: 600 * 60 * 24))
        ])
    }
}
