//
//  HomeView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 08.10.2023.
//

import SwiftUI

struct HomeView: View {
    
    
    let Manager: NotificationManager = NotificationManager()
    
    var body: some View {
        TabView{
            AddReminderView()
                .tabItem{
                    Text("Reminders")
                }
            ChoseNotificationView(Manager: Manager)
                .tabItem{
                    Text("Notifications")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        HomeView()
    }
}
