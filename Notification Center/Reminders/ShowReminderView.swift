//
//  AddReminderView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 06.10.2023.
//

import SwiftUI

struct AddReminderView: View {
    @State var reminders: [String]
    @State var wasSuccesful: Bool
    
    var body: some View {
        if reminders.isEmpty {
            Text("neco se posralo bro")
        } else {
            List {
                ForEach(reminders, id: \.self) { reminder in
                    Text(reminder)
                }
            }
            .task {
                wasSuccesful = saveListOfReminders(reminders: reminders)
                do{ try await reminders =  returnListOfReminders()}
                catch{
                    print("An error occurred: \(error)")
                }
                
            }
        }
        
    }
}


struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView(reminders: ["xd", "xd2"], wasSuccesful: true)
    }
}
