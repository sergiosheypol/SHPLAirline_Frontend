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
            AirportsPickerView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Book a flight")
            }
        }
        
//        AirportsPickerView()
    }
}

struct AppView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        AppView()
    }
}
