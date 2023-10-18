//
//  AddNotificationView.swift
//  Notification Center
//
//  Created by Jakub Klucký on 11.10.2023.
//

import SwiftUI




struct ChoseNotificationView: View {
    
    let notificationManager: NotificationManager
 
    @State var currentDate: Date = Date()
    var closeRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    @State var present: Bool = false
    @State var selectedView: Int = 0
    @State var ViewToPopOver: AnyView = AnyView(NotificationBasedOnTimeView())
    
    init(Manager: NotificationManager){
        
        notificationManager = Manager
        
    }
    
    var body: some View {
        NavigationView{
        
            VStack{
                Spacer()
                //TODO: finish this picker for selection of three views based on wich type of notification user wants to add video rresource swiftful thinking notification video than add it .popover and somehow manage to make shownotification work
                Picker("Chose notification Type", selection: $selectedView, content: {
                    Text("By Time").tag(1)
                    Text("By Date").tag(2)
                    Text("By Location").tag(3)
                })
                .pickerStyle(NavigationLinkPickerStyle())
                .padding(20)
                
                Button("Add Notification") {
                    
                    switch selectedView {
                    case 1:
                      ViewToPopOver = AnyView(NotificationBasedOnTimeView())
                    case 2:
                        ViewToPopOver = AnyView(NotificationBasedOnDateView())
                    case 3:
                        ViewToPopOver = AnyView(NotificationBasedOnLocationView())
                    default:
                        ViewToPopOver = AnyView(NotificationBasedOnTimeView())
                    }
                    
                    present.toggle()
                    print(currentDate.timeIntervalSinceNow)
                }
                .padding()
                .popover(isPresented: $present, content: {
                    ViewToPopOver
                })
                
                NavigationLink {
                    ShowNotificationView()
                } label: {
                    Text("Show Notifications")
                }
                
                Spacer()

            }
            .onAppear {
                notificationManager.requestAuthorization()
            }
            }
        
    }
}

struct ChoseNotificationView_Previews: PreviewProvider {
    
    static let notifcationManager = NotificationManager()
    
    static var previews: some View {
        
        ChoseNotificationView(Manager: notifcationManager)
    }
}
