//
//  LocalSaveReminders.swift
//  Notification Center
//
//  Created by Jakub Klucký on 06.10.2023.
//

import Foundation

func saveStringtOfReminders(reminders: String ) {
    let defaults = UserDefaults.standard
    defaults.set(reminders, forKey: "RemindersString")

}

func saveListOfReminders(reminders: [String] ) {
    let defaults = UserDefaults.standard
    defaults.set(reminders, forKey: "RemindersArray")

}
enum ReminderError: Error {
    case retrievalFailure
}

func returnStringOfReminders() throws -> String {
    let defaults = UserDefaults.standard
    if let reminders = defaults.string(forKey: "RemindersString") as? String {
        
        return reminders
        
        
    } else {
        
        throw ReminderError.retrievalFailure
    }
}
func returnListOfReminders()  -> [String] {
    let defaults = UserDefaults.standard
    guard let reminders = defaults.stringArray(forKey: "RemindersArray") else{ return ["error"]}
        
        return reminders
        
        
   
}
