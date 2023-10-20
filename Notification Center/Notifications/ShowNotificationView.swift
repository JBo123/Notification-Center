//
//  ShowNotificationView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 09.10.2023.
//

import SwiftUI

struct ShowNotificationView: View {
    
    let expireDate: Date = Date()
    var notificationList: [Notification] = []
    var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
    }
    
    var body: some View {
       
        List(notificationList) { notification in
            VStack{
                HStack{
                    
                }
                Button("..."){
                    
                }
            }
        }
        
    }
}

struct ShowNotificationView_Previews: PreviewProvider {
    
   @State static var notification = Notification(title: "DO DISHES", //this is maybe wrong (shouldnt be static imo)
                                                 text: "this is description of the notification :!",
                                                 date: Date())
    static var previews: some View {
        ShowNotificationView(notification: notification)
    }
}
