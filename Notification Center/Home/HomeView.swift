//
//  HomeView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 08.10.2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView{
            AddReminderView()
                .tabItem{
                    Text("Reminders")
                }
            ChoseNotificationView()
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
