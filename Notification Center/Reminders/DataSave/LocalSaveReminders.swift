//
//  LocalSaveReminders.swift
//  Notification Center
//
//  Created by Jakub Klucký on 06.10.2023.
//

import Foundation

func saveListOfReminders(reminders: [String]) -> Bool {
    let defaults = UserDefaults.standard
    defaults.set(reminders, forKey: "RemindersArray")
    
    let didSave = defaults.synchronize()
    
    if didSave {
        
        return true
        
    } else {
        
        return false
    }
}
enum ReminderError: Error {
    case retrievalFailure
}

func returnListOfReminders() throws -> [String] {
    let defaults = UserDefaults.standard
    if let reminders = defaults.array(forKey: "RemindersArray") as? [String] {
        
        return reminders
        
    } else {
        
        throw ReminderError.retrievalFailure
    }
}
