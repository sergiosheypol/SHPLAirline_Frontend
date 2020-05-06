//
//  AppView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            FlightPickerView().tabItem {
                Image(systemName: "airplane")
                Text("Book a flight")
            }
            BookingsView().tabItem{
                Image(systemName: "bag")
                Text("Bookings")
            }
            CheckoutView().tabItem {
                Image(systemName: "creditcard")
                Text("Basket")
            }
            UserProfileMgmtView().tabItem{
                Image(systemName: "person")
                Text("Profile")
            }
            
        }.accentColor(.green)
        
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
