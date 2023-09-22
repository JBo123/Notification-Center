//
//  AddNotificationView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 21.09.2023.
//

import SwiftUI
import UserNotifications

struct AddNotificationView: View {
    
    @State private var notificationText = ""
    @State private var secondsUntilNotification = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    private var notification: Notification = Notification()
    var body: some View {
        VStack {
            TextField("Notification text", text: $notificationText)
            
            TextField("Seconds until notification", text: $secondsUntilNotification)
                .onChange(of: secondsUntilNotification) { value in
                    guard let number = Int(value),
                          number > 0 else {
                        self.secondsUntilNotification = ""
                        return
                    }
                    self.secondsUntilNotification = String(number)
                }
            
            Button("Start notification") {
                notification.addNotification(notificationText: notificationText,
                                             secondsUntilNotification: secondsUntilNotification,
                                             alertTitle: alertTitle, alertMessage: alertMessage,
                                             showAlert: showAlert)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct AddNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AddNotificationView()
    }
}
