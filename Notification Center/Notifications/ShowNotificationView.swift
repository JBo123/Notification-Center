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
            List(notificationList) { notification in
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
                .onTapGesture {
                    NavigationLink(destination: DetailNotificationView(notification: notification), label: {
                        Text("")
                    })
                }
                
            }
            .onAppear(){
                notificationList = returnListOfNotifications()
            }
        }
    }
}

struct ShowNotificationView_Previews: PreviewProvider {
    
   
    static var previews: some View {
        ShowNotificationView(notificationList: NotificationsDummyList)
    }
}
