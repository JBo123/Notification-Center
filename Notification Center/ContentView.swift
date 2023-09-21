//
//  ContentView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 18.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            NavigationView {
                NavigationLink(destination: loginView()) {
                        Text("Login")
                    }
                NavigationLink(destination: registerView()) {
                        Text("Register")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
