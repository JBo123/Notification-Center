//
//  AddReminderView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 06.10.2023.
//

import SwiftUI

struct ShowReminderView: View {
    @State var singleReminder = ""
    @State var reminders: [String] = []
    @State var wasSuccesful: Bool = false
    
    var body: some View {
      VStack{
                List {
                    ForEach(reminders, id: \.self) { reminder in
                        Text(reminder)
                    }.onDelete { indexSet in
                        //contacts.remove(atOffsets: indexSet)
                        deleteFromListOfReminders(reminders: reminders,
                                                  indexSet: indexSet)
                    }
                   //Text(singleReminder)
                }
          Button("Show Reminders", action: {

                   reminders =  returnListOfReminders()
                        //try singleReminder = returnStringOfReminders()
                 
                    
                })
            }
        
        
    }
}


struct ShowReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ShowReminderView(reminders: ["xd", "xd2"], wasSuccesful: true)
    }
}
