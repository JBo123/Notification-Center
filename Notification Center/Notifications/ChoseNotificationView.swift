//
//  AddNotificationView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 11.10.2023.
//

import SwiftUI

struct ChoseNotificationView: View {
    @State var currentDate: Date = Date()
    var closeRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    @State var present: Bool = false
    @State var selectedView: View
    var body: some View {
        NavigationView{
        
            
         
                //TODO: finish this picker for selection of three views based on wich type of notification user wants to add video rresource swiftful thinking notification video than add it .popover and somehow manage to make shownotification work
                Picker(selection: $selectedView, content: {
                    Text("View 1").tag(NotificationBasedOnDateView())
                    Text("View 2").tag(NotificationBasedOnTimeView())
                    Text("View 3").tag(NotificationBasedOnLocationView())
                            })

            /*    Section(header: Text("Pick Date")) {
                    DatePicker(
                        "Pick a date:",
                        selection: $currentDate,
                        in: Date()...,
                        displayedComponents: [.hourAndMinute, .date]
                    )
                }
            }*/
            
       
                    Button("Add Notification") {
                        present.toggle()
                        print(currentDate.timeIntervalSinceNow)
                    }
                    .popover(isPresented: $present, content: {
                        OldAddNotificationView()
                    })
                    
                    NavigationLink {
                        ShowNotificationView()
                    } label: {
                        Text("Show Notifications")
                    }
                
            }
        }
    }
}

struct ChoseNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ChoseNotificationView()
    }
}
