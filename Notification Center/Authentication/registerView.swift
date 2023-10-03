//
//  registerView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 19.09.2023.
//

import SwiftUI
import  FirebaseAuth

struct registerView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Email")) {
                    TextField("Enter your email", text: $email)
                        .textContentType(.none)
                }

                Section(header: Text("Password")) {
                    SecureField("Enter your password", text: $password)
                }

                Button(action: {
                    // Authenticate the user
                    Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                        if let error = error {
                            // Handle the error
                            print(error)
                        } else {
                        NavigationLink(destination: AddNotificationView()) {
                                Text("register")
                            }
                        }
                    }
                }) {
                    Text("Login")
                }
            }
            .navigationTitle("Register")
            
            Section(header: Text("Already Have an account?")) {
                
                NavigationLink(destination: loginView()) {
                        Text("Login")
                    }
                    
                    
            }
        }
    }
}

struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        registerView()
    }
}
