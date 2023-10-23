//
//  Notification.swift
//  Notification Center
//
//  Created by Jakub Klucký on 21.09.2023.
//

import Foundation
import UserNotifications
                                                                            //24 hours from now
var NotificationsDummyList: [Notification] = [
    Notification(title: "1", date: Date(timeIntervalSinceNow: 60 * 60 * 24)),
    Notification(title: "2", date: Date(timeIntervalSinceNow: 60 * 60 * 24)),
    Notification(title: "3", date: Date(timeIntervalSinceNow: 60 * 60 * 24)),
    Notification(title: "4", date: Date(timeIntervalSinceNow: 60 * 60 * 24)),
    Notification(title: "5", date: Date(timeIntervalSinceNow: 60 * 60 * 24))
]

class Notification: Identifiable, ObservableObject, Codable {
    let id:UUID = UUID()
    var title: String
    var text: String
    var date: Date
    var secondsToNotify:Double//mabe it has to be INT
    
    init(title: String = "No Title", text: String = "No description", date:Date){
        self.title = title
        self.text = text
        self.date = date
        self.secondsToNotify = date.timeIntervalSinceNow
        
    }
    
    

    
}
    
  /*  func addNotification(notificationText: String,
                         secondsUntilNotification:String,
                         alertTitle: String,
                         alertMessage: String,
                         showAlert: Bool) -> Void {
        
        let notificationText = notificationText
        let secondsUntilNotification = secondsUntilNotification

        var alertTitle = alertTitle
        var alertMessage = alertMessage
        var showAlert = showAlert
        
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
}*/


/*
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
 */
