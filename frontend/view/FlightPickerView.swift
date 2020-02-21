//
//  FlightPickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct FlightPickerView: View {
    
    @EnvironmentObject var locationsBffProvider: LocationBffProvider
    
    var body: some View {
        
        NavigationView {
                List {
                    
                    Section {
                        Text("Date picker")
                    }
                    
                    Section{
                        ForEach(locationsBffProvider.getAirports(), id: \.self) { airport in
                           AirportRowView(airport: airport)
                        }
                    }
                }.navigationBarTitle(Text("Book a flight"))
                .listStyle(GroupedListStyle())
            }            
        }
        
}

struct FlightPickerView_Previews: PreviewProvider {
    
    static var locationsTest = LocationBffProvider()
    
    static var previews: some View {
        FlightPickerView().environmentObject(locationsTest)
    }
}
