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
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Departure airport")) {
                    NavigationLink(destination: DepartureAirportSelectionView()) {
                        
                        if tripDetails.getDepartureAirport().iataCode == "" {
                            Text("Choose airport").foregroundColor(.gray)
                        } else {
                            GenericRowItem(title: tripDetails.getCityFrom().name,
                                           subtitle: tripDetails.getDepartureAirport().iataCode)
                        }
                        
                    }
                }
                
                Section(header: Text("Arrival airport")) {
                    NavigationLink(destination: ArrivalAirportSelectionView()) {
                        if tripDetails.getArrivalAirport().iataCode == "" {
                            Text("Choose airport").foregroundColor(.gray)
                        } else {
                            GenericRowItem(title: tripDetails.getCityTo().name,
                                           subtitle: tripDetails.getArrivalAirport().iataCode)
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("Choose your flight"))
            .listStyle(GroupedListStyle())
        }
        
    }
}

struct AirportsPickerView_Previews: PreviewProvider {
    
    static var selectedAirports = TripDetails()
    
    static var previews: some View {
        AirportsPickerView().environmentObject(selectedAirports)
    }
}
