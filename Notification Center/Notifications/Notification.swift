//
//  Notification.swift
//  Notification Center
//
//  Created by Jakub Klucký on 21.09.2023.
//

import Foundation
import UserNotifications
class Notification {
    
    func addNotification(notificationText: String,
                         secondsUntilNotification:String,
                         alertTitle: String,
                         alertMessage: String,
                         showAlert: Bool) -> Void {
        
        var notificationText = notificationText
        var secondsUntilNotification = secondsUntilNotification

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
}


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
