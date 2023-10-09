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

func returnStringOfReminders() -> String {
    let defaults = UserDefaults.standard
    guard let reminders = defaults.string(forKey: "RemindersString") else {return "error"}
        
        return reminders
        
}
func returnListOfReminders()  -> [String] {
    let defaults = UserDefaults.standard
    guard let reminders = defaults.stringArray(forKey: "RemindersArray") else{ return ["error"]}
        
        return reminders
}

func deleteListOfData(){
    DispatchQueue.main.async {
        UserDefaults.standard.removeObject(forKey: "RemindersArray")
    }
}

func addToListOfReminders(reminders: [String], input: String){
    
    var reminders = reminders
    
    reminders = returnListOfReminders()
    reminders.append(input)
    saveListOfReminders(reminders: reminders)
    
}

func deleteFromListOfReminders(reminders: [String], indexSet: IndexSet){
    var reminders = reminders
    
    reminders = returnListOfReminders()
    reminders.remove(atOffsets: indexSet)
    saveListOfReminders(reminders: reminders)
}

