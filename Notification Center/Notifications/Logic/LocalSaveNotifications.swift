//
//  LocalSaveNotifications.swift
//  Notification Center
//
//  Created by Jakub Klucký on 21.10.2023.
//

import Foundation

func saveListOfNotifications(notificationsList: [Notification]){
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(notificationsList)
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: "NotificationsArray")
    } catch {
        print("error thrown by encoder: \(error)")
    }
}


func returnListOfNotifications() -> [Notification] {
    let decoder = JSONDecoder()
    let defaults = UserDefaults.standard
    guard let data = defaults.object(forKey: "NotificationsArray") as? Data else { return [] }
    
    var notifications: [Notification] = []
    
    do {
        notifications = try decoder.decode([Notification].self, from: data)
    } catch {
        print("error thrown by decoder: \(error)")
        return []
    }
    
    return notifications
}

func deleteFromListOfNotifications(notificationList: [Notification], indexSet: IndexSet){
    
    var notificationList = notificationList
    notificationList = returnListOfNotifications()
    notificationList.remove(atOffsets: indexSet)
    saveListOfNotifications(notificationsList: notificationList)
    
}


