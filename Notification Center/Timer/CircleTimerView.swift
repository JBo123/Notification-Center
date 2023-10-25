//
//  CircleTimerView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 11.10.2023.
//

import SwiftUI

struct CircleTimerView: View {
    
    @State var progressBarValue = 0.00
    @State var secondsToNotify: Double
    @State var displaySeconds: String = ""
    
//TODO: 1: devide seconds to niótify as 100 to get one piece of the circle
//      2. make it one seccond every second  mminus
    //  3. how to make seconds into minute and hours to time format...
    var body: some View {
        
        ZStack{
            Color.white //(red: 0.9, green: 0.9, blue: 0.9)
                .ignoresSafeArea()
            
            VStack{
                
                ZStack{
                    
                Circle()
                        .stroke(.black.opacity(0.1),
                        lineWidth: 15)
                        .frame(width: 120)
                        .padding([.bottom, .top])
                    
                    Circle()
                        .trim(from: progressBarValue, to: 1)
                        .stroke(.teal, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 120)
                        .padding([.bottom, .top])
                    
                    VStack{
                        Text(displaySeconds)
                            .foregroundColor(.black)
                            .font(.title3)
                            .onReceive(Timer.publish(every: 1,
                                                     on: .main,
                                                     in: .common).autoconnect()) { _ in
                                
                                displaySeconds = subtractOneSecond(from: displaySeconds) ?? displaySeconds
                                progressBarValue += 1/secondsToNotify
                            }
                            .font(.system(size: 50))
                    }
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                
                    
                }
                .padding(.horizontal, 40)
                
            }
        }
        .onAppear(){
            displaySeconds = convertSecondsToDate(seconds: Int(secondsToNotify))
        }
        
    }
}



struct CircleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CircleTimerView(secondsToNotify: 100.0)
    }
}
