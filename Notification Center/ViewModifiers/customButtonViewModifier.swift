//
//  customButtonViewModifier.swift
//  Notification Center
//
//  Created by Jakub Klucký on 15.10.2023.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .background(Color.blue)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .padding()
            .cornerRadius(10)
        
            
    }
    
}
