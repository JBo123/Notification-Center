//
//  AddReminderView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 06.10.2023.
//

import SwiftUI

struct AddReminderView: View {
    @State var input: String = ""
    @State var reminders: [String] = []
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Email")) {
                    TextField("Enter your email", text: $input)
                        .textContentType(.none)
                }
                Button("Add", action: {
                    reminders.append(input)
                })
                

                NavigationLink {
                    ShowReminderView(reminders: reminders)
                } label: {
                    Text("Show Reminders")
                }


            }
            .navigationTitle("Register")
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}
