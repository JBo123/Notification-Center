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
                guard !notificationText.isEmpty,
                      let seconds = Int(secondsUntilNotification),
                      seconds > 0 else {
                    alertTitle = "Invalid inputs"
                    alertMessage = "Please enter a valid notification text and time."
                    showAlert = true
                    return
                }
                
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                    if granted {
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(seconds), repeats: false)
                        let content = UNMutableNotificationContent()
                        content.title = "Notification"
                        content.body = notificationText
                        let request = UNNotificationRequest(identifier: "notificationIdentifier", content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request) { error in
                            if let error = error {
                                alertTitle = "Error scheduling notification"
                                alertMessage = "Error: \(error.localizedDescription)"
                                showAlert = true
                            } else {
                                alertTitle = "Success"
                                alertMessage = "Notification scheduled successfully"
                                showAlert = true
                            }
                        }
                    } else if let error = error {
                        alertTitle = "Error requesting authorization for notifications"
                        alertMessage = "Error: \(error.localizedDescription)"
                        showAlert = true
                    } else {
                        alertTitle = "Notification permissions not granted"
                        alertMessage = "Please enable notifications for this app in settings."
                        showAlert = true
                    }
                }
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
