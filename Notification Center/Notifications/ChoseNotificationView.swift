//
//  AddNotificationView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 11.10.2023.
//

import SwiftUI




struct ChoseNotificationView: View {
    
 
    @State var notificationList: [Notification] = []
    @State var currentDate: Date = Date()
    var closeRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    @State var present: Bool = false
    @State var selectedView: Int = 0
    @State var ViewToPopOver: AnyView? = nil
    
    
    var body: some View {
        
        NavigationView{
        
            VStack{
                
                Spacer()

                Picker("Chose notification Type", selection: $selectedView, content: {
                    Text("Chose Here...").tag(0)
                    Text("By Time").tag(1)
                    Text("By Date").tag(2)
                    Text("By Location").tag(3)
                })
                .pickerStyle(NavigationLinkPickerStyle())
                .padding(20)
                
                Button("Add Notification") {
                /*
                    switch selectedView {

                    case 1:
                        ViewToPopOver = AnyView(NotificationBasedOnTimeView(notificationList: notificationList, present: $present))
                    case 2:
                        ViewToPopOver = AnyView(NotificationBasedOnDateView())
                    case 3:
                        ViewToPopOver = AnyView(NotificationBasedOnLocationView())
                    default:
                        ViewToPopOver = AnyView(NotificationBasedOnTimeView(notificationList: notificationList, present: $present))
                    }
                    */
                  // print(ViewToPopOver)
                        present.toggle()
                    
                  //  print(currentDate.timeIntervalSinceNow)
                    
                }
                .disabled( selectedView == 0)
                .padding()
                .popover(isPresented: $present, content: {
                    switch selectedView {

                    case 1:
                        NotificationBasedOnTimeView(notificationList: notificationList, present: $present)
                    case 2:
                       NotificationBasedOnDateView()
                    case 3:
                        NotificationBasedOnLocationView()
                    default:
                        NotificationBasedOnTimeView(notificationList: notificationList, present: $present)
                    }
                })
                
                NavigationLink {
                    ShowNotificationView(notificationList: notificationList)
                } label: {
                    Text("Show Notifications")
                }
                
                Spacer()

            }
            .onAppear {
                NotificationManager.shared.requestAuthorization()
            }
            }
        
    }
}

struct ChoseNotificationView_Previews: PreviewProvider {
        
    static var previews: some View {
        
        ChoseNotificationView()
    }
}
