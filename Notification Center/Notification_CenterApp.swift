//
//  Notification_CenterApp.swift
//  Notification Center
//
//  Created by Jakub Klucký on 18.09.2023.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

@main
struct Notification_CenterApp: App {

    init() {
           FirebaseApp.configure()
       }
    
    var body: some Scene {
        
        WindowGroup {
            if Auth.auth().currentUser != nil {
               HomeView()
                
            } else {
                loginView()
            }
            
            //ContentView()
            //AddNotificationView()*/
        //CircleTimerView(secondsToNotify: 1000, displayDate: Date(timeIntervalSinceNow: 60 * 60 * 24))
            //this value is propably souvisis s polu tazke to musi davat smysl
            

        }
    }
}
