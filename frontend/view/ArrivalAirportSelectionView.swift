//
//  FlightPickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct ArrivalAirportSelectionView: View {
    
    @EnvironmentObject var locationsBffProvider: LocationBffProvider
    @EnvironmentObject var tripDetails: TripDetails
    
    @State var autocompletePhrase = ""
    
    @State var areThereSuggestions = false
    
    var body: some View {
        
        NavigationView {
            List {
                
                Section {
                    TextField("",text: $autocompletePhrase)
                    Button(action: {
                        self.locationsBffProvider.getAutocomplete(phrase: self.autocompletePhrase)
                        print(self.locationsBffProvider.getSuggestions())
                        self.areThereSuggestions = true
                    }) {
                        Text("Search for airports")
                    }
                }
                
                
                if tripDetails.getArrivalAirport().iataCode != "" {
                    Section(header: Text("Current selection")){
                        GenericRowItem(title: tripDetails.getCityTo().name, subtitle: tripDetails.getArrivalAirport().iataCode)
                    }
                }
                
                if areThereSuggestions {
                    Section(header: Text("Departure airports")){
                        
                        ForEach(locationsBffProvider.getSuggestions(), id: \.self) { suggestion in
                            Button(action: {
                                
                                self.tripDetails.setArrivalAirport(airport:
                                    Airport(iataCode: suggestion.code,
                                            name: "",
                                            seoName: "",
                                            countryCode: suggestion.country.code,
                                            regionCode: "",
                                            cityCode: suggestion.city.code,
                                            currencyCode: suggestion.country.currency))
                                
                                self.tripDetails.setCityTo(city:
                                    City(code: suggestion.city.code,
                                         name: suggestion.city.name,
                                         countryCode: suggestion.city.countryCode))
                            }) {
                                
                                GenericRowItem(title: suggestion.city.name, subtitle: suggestion.code)
                            }.foregroundColor(.black)
                        }
                    }
                }
            }.navigationBarTitle(Text("Select arrival airport"))
            .listStyle(GroupedListStyle())
            .onAppear(perform: {
                self.locationsBffProvider.getAutocomplete(phrase: "")
                self.areThereSuggestions = true
            })
        }
    }
    
}

struct ArrivalAirportSelectionView_Previews: PreviewProvider {
    
    static var locationsTest = LocationBffProvider()
    static var selectedAirports = TripDetails()
    
    static var previews: some View {
        ArrivalAirportSelectionView().environmentObject(locationsTest).environmentObject(selectedAirports)
    }
}
