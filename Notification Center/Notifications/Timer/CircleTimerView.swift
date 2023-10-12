//
//  CircleTimerView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 11.10.2023.
//

import SwiftUI

struct CircleTimerView: View {
    @AppStorage("streak") var streak = 0
    @State var progressBarValue = 0.00
    @State var reminderTime: Date
    var body: some View {
        
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack{
                
                ZStack{
                    
                Circle()
                        .stroke(.white.opacity(0.2),
                        lineWidth: 20)
                    
                    Circle()
                        .trim(from: 0, to: progressBarValue)
                        .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.degrees(-90))
                    
                    VStack{
                        Text("4:36:58")
                            .font(.system(size: 50))
                    }
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                
                    
                }
                .padding(.horizontal, 40)
                
                Button("xd") {
                progressBarValue += 0.01
                }
                .padding()
            }
        }
        
    }
}

struct CircleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CircleTimerView(reminderTime: Date())
    }
}
