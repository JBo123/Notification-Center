//
//  loginView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 18.09.2023.
//

import SwiftUI
//import FirebaseAuth

struct loginView: View {

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Email")) {
                    TextField("Enter your email", text: $email)
                }

                Section(header: Text("Password")) {
                    SecureField("Enter your password", text: $password)
                }

                Button(action: {
                    // Authenticate the user
                    Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                        if let error = error {
                            // Handle the error
                            print(error)
                        } else {
                            // The user is successfully authenticated
                            // Navigate to the next screen
                        }
                    }
                }) {
                    Text("Login")
                }
            }
            .navigationTitle("Login")
        }
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
