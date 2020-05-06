//
//  AppView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @State var selectedTab = 0
    @EnvironmentObject var viewsManager: ViewsManager
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FlightPickerView().tabItem {
                Image(systemName: "airplane")
                Text("Book a flight")
            }
            .tag(0)
            CheckoutView().tabItem {
                Image(systemName: "creditcard")
                Text("Basket")
            }.tag(1)
            BookingsView().tabItem{
                Image(systemName: "bag")
                Text("Bookings")
            }.tag(2)
                
            UserProfileMgmtView().tabItem{
                Image(systemName: "person")
                Text("Profile")
            }.tag(3)
            
        }.accentColor(.green)
            
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
