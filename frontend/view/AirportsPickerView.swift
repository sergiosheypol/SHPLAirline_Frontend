//
//  AirportsPickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct AirportsPickerView: View {
    
    @EnvironmentObject var tripDetails: TripDetails
    
    @State private var current: Int? = nil
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Departure airport")) {
                    NavigationLink(destination: AirportSelectionView(viewName: FlightType.DEPARTURE), tag: 1, selection: $current) {
                        showPicker(airportOpt: tripDetails.departureAirport, cityOpt: tripDetails.cityFrom)
                    }
                }
                
                Section(header: Text("Arrival airport")) {
                    NavigationLink(destination: AirportSelectionView(viewName: FlightType.ARRIVAL), tag: 2, selection: $current) {
                        showPicker(airportOpt: tripDetails.arrivalAirport, cityOpt: tripDetails.cityTo)
                    }
                    
                }
            }
            .navigationBarTitle(Text("Choose your flight"))
            .listStyle(GroupedListStyle())
        }
        
    }
    
    func showPicker(airportOpt: Airport?, cityOpt: City?) -> GenericRowItem {
        guard let airport = airportOpt,
        let city = cityOpt else {
            return GenericRowItem(title: "Choose airport", subtitle: "Tap on it")
        }
        
        return GenericRowItem(title: city.name, subtitle: airport.iataCode)
    }
    



}

struct AirportsPickerView_Previews: PreviewProvider {
    
    static var selectedAirports = TripDetails()
    
    static var previews: some View {
        AirportsPickerView().environmentObject(selectedAirports)
    }
}
