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
    
    @EnvironmentObject var viewController: ViewController
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Departure airport")) {
                    NavigationLink(destination: AirportSelectionView(viewName: FlightType.DEPARTURE), tag: 1, selection: $viewController.selected) {
                        showPicker(airportOpt: tripDetails.departureAirport, cityOpt: tripDetails.cityFrom)
                    }
                }
                
                Section(header: Text("Arrival airport")) {
                    NavigationLink(destination: AirportSelectionView(viewName: FlightType.ARRIVAL), tag: 2, selection: $viewController.selected) {
                        showPicker(airportOpt: tripDetails.arrivalAirport, cityOpt: tripDetails.cityTo)
                    }
                    
                }
            }
            .navigationBarTitle(Text("Choose your flight"))
            .listStyle(GroupedListStyle())
        }
        
    }
    
    func showPicker(airportOpt: Airport?, cityOpt: City?) -> GenericRowItemView {
        guard let airport = airportOpt,
        let city = cityOpt else {
            return GenericRowItemView(title: "Choose airport", subtitle: "Tap on it")
        }
        
        return GenericRowItemView(title: city.name, subtitle: airport.iataCode)
    }
    



}

struct AirportsPickerView_Previews: PreviewProvider {
    
    static var selectedAirports = TripDetails()
    
    static var previews: some View {
        AirportsPickerView().environmentObject(selectedAirports)
    }
}
