//
//  NotificationWidgetBundle.swift
//  NotificationWidget
//
//  Created by Jakub Klucký on 05.10.2023.
//

import WidgetKit
import SwiftUI

@main
struct NotificationWidgetBundle: WidgetBundle {
    var body: some Widget {
        NotificationWidget()
        NotificationWidgetLiveActivity()
    }
}
