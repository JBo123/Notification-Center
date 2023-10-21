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
       
        List(notificationList) { notification in
            VStack{
                HStack{
                    VStack{
                        Text(notification.title)
                        Text(notification.text)
                    }
                    CircleTimerView(secondsToNotify: notification.secondsToNotify)
                }
                Button("..."){
                    
                }
            }
        }
        
    }
}

struct ShowNotificationView_Previews: PreviewProvider {
    
   
    static var previews: some View {
        ShowNotificationView(notificationList: [])
    }
}
