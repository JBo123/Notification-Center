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
                    }
                   //Text(singleReminder)
                }
          Button("Show Reminders", action: {
                    if !reminders.isEmpty{
                    //    wasSuccesful = saveListOfReminders(reminders: reminders)
                    }
                    do{
                        try reminders =  returnListOfReminders()
                        //try singleReminder = returnStringOfReminders()
                        
                    } catch {
                        print("An error occurred: \(error)")
                    }
                    
                })
            }
        
        
    }
}


struct ShowReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ShowReminderView(reminders: ["xd", "xd2"], wasSuccesful: true)
    }
}
