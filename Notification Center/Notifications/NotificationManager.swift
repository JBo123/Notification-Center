//
//  NotificationManager.swift
//  Notification Center
//
//  Created by Jakub Klucký on 16.10.2023.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { succes, error in
            if let error = error {
                print(error)
            } else {
                print("xd")
            }
        }
    }
    
    func scheduleNotificationByTime(title: String = "needed to do something but forgor to write it here",
                                    subtitle: String = "So now u r fucked",
                                    timeInterval: Double){
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    
}
