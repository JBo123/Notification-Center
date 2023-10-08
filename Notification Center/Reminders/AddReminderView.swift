//
//  AddReminderView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 06.10.2023.
//

import SwiftUI

struct AddReminderView: View {
    @State var wasSuccesful = false
    @State var input: String = ""
    @State var reminders: String = ""
    @State var remindersList: [String] = []

    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Reminder")) {
                    TextField("Write here...", text: $input)
                        .textContentType(.none)
                }
                Button("Add", action: {
                    remindersList =  returnListOfReminders()
                    remindersList.append(input)
                    saveListOfReminders(reminders: remindersList)
                        wasSuccesful.toggle()
                    
                })
                .alert(isPresented: $wasSuccesful) {
                    Alert(title: Text("Reminder"), message: Text("Message Added"), dismissButton: .default(Text("OK")))
                    
                }
                

                NavigationLink {
                    ShowReminderView()
                } label: {
                    Text("Show Reminders")
                }


            }
            .navigationTitle("Add Reminder")
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}
