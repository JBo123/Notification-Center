//
//  CircleTimerView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 11.10.2023.
//

import SwiftUI

//final class Presenter: ObservableObject {
//
//    @Published var viewModel: ViewModel
//
//    init() {
//
//        self.viewModel = ViewModel(progressValue: 0)
//    }
//
//    func onTap() {
//
//
//    }
//}
//
//struct ViewModel {
//
//    var progressValue: Double
//}

struct CircleTimerView: View {
    //@ObservedObject var presenter = Presenter()
    @AppStorage("streak") var streak = 0
    @State var progressBarValue = 1.00
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var secondsToNotify: Double
//TODO: 1: devide seconds to niótify as 100 to get one piece of the circle
//      2. make it one seccond every second  mminus
    //  3. 
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
                progressBarValue -= 0.01
                }
                .padding()
            }
        }
        
    }
}



struct CircleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CircleTimerView(secondsToNotify: 100)
    }
}
