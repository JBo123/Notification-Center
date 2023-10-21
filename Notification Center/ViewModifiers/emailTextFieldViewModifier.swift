//
//  AlertViewModifier.swift
//  Notification Center
//
//  Created by Jakub Klucký on 14.10.2023.
//

import Foundation
import SwiftUI

struct DisableAutocorrect: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .textContentType(.none)
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
    
}


