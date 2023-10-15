//
//  AlertViewModifier.swift
//  Notification Center
//
//  Created by Jakub Klucký on 14.10.2023.
//

import Foundation
import SwiftUI

struct SuccessfulAlert: ViewModifier {
    
    let title: String
    let message: String
    var wasSuccessful: Bool
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: $wasSuccessful) {
                
                Alert(title: Text(title),
                      message: Text(message),
                      dismissButton: .default(Text("OK")))
            }
            
    }
    
}


