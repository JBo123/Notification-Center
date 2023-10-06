//
//  loginView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 18.09.2023.
//

import SwiftUI
import FirebaseAuth

struct loginView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Email")) {
                    TextField("Enter your email", text: $email)
                        .textContentType(.none)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }

                Section(header: Text("Password")) {
                    SecureField("Enter your password", text: $password)
                }

                
                    Button(action: {
                        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                            if let error = error {
                                errorMessage = error.localizedDescription
                            } else {
                                // Update the login state when successful
                                isLoggedIn = true
                            }
                        }
                    }) {
                        Text("Login")
                    }
                
                .disabled(isLoggedIn) // Disable the button when the user is logged in

                // Use the NavigationLink with an if statement to conditionally navigate
                if isLoggedIn {
                    NavigationLink(destination: AddNotificationView()) {
                        // This is an empty view; you can use any view you prefer
                    }
                }
                Section(header: Text("Haven't Loged in yet?")) {
           
                        NavigationLink(destination: registerView()) {
                            Text("Register")
                        }
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
