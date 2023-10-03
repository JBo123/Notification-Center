//
//  Notification_CenterApp.swift
//  Notification Center
//
//  Created by Jakub Klucký on 18.09.2023.
//

import SwiftUI
import Firebase
import FirebaseCore
import Firebase

@main
struct Notification_CenterApp: App {

    init() {
           FirebaseApp.configure()
       }
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //AddNotificationView()
            loginView()
        }
    }
}
