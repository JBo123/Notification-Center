//
//  DetailNotificationView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 23.10.2023.
//

import SwiftUI

struct DetailNotificationView: View {
    @State var notification: Notification
    var body: some View {
        VStack{
            Text(notification.title)
                .font(.caption)
        }
        
    }
}

struct DetailNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNotificationView(notification: Notification(date: Date(timeIntervalSinceNow: 60 * 60 * 24)))
    }
}
