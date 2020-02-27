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
            FlightPickerView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Book a flight")
            }
        }
        
    }
}

struct AppView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        AppView()
    }
}
