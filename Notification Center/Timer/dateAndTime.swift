//
//  dateAndTime.swift
//  Notification Center
//
//  Created by Jakub Klucký on 23.10.2023.
//

import Foundation


func convertFromDatetoTimeString(date: Date) -> String {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    let timeString = dateFormatter.string(from: date)
    return timeString
    
}

func convertSecondsToDate(seconds: Int) -> String {
    let (h, m) = (seconds / 3600, (seconds % 3600) / 60)
    let s = (seconds % 3600) % 60
    let output = "\(h):\(m):\(s)"
    return output
}

func subtractOneSecond(from timeString: String) -> String? {
    let components = timeString.components(separatedBy: ":")
    
    guard components.count == 3,
          let hours = Int(components[0]),
          let minutes = Int(components[1]),
          let seconds = Int(components[2]) else {
        return nil
    }
    
    var totalSeconds = (hours * 60 * 60) + (minutes * 60) + seconds
    totalSeconds -= 1
    
    if totalSeconds < 0 {
        return nil
    }
    
    let updatedHours = totalSeconds / (60 * 60)
    let updatedMinutes = (totalSeconds % (60 * 60)) / 60
    let updatedSeconds = totalSeconds % 60
    
    let updatedTimeString = String(format: "%02d:%02d:%02d", updatedHours, updatedMinutes, updatedSeconds)
    return updatedTimeString
}

