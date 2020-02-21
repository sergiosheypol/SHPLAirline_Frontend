//
//  FlightPickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct DepartureAirportSelectionView: View {
    
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
                
                
                if tripDetails.getDepartureAirport().iataCode != "" {
                    Section(header: Text("Current selection")){
                        GenericRowItem(title: tripDetails.getCityFrom().name, subtitle: tripDetails.getDepartureAirport().iataCode)
                    }
                }
                
                if areThereSuggestions {
                    Section(header: Text("Departure airports")){

                        ForEach(locationsBffProvider.getSuggestions(), id: \.self) { suggestion in
                            
//                            Text(airport.code)
                            Button(action: {
                                self.tripDetails.setDepartureAirport(airport:
                                    Airport(iataCode: suggestion.code,
                                            name: "", seoName: "",
                                            countryCode: suggestion.country.code,
                                            regionCode: "",
                                            cityCode: suggestion.city.code,
                                            currencyCode: suggestion.country.currency))
                                
                                self.tripDetails.setCityFrom(city:
                                    City(code: suggestion.city.code,
                                         name: suggestion.city.name,
                                         countryCode: suggestion.city.countryCode))
                            }) {
                                GenericRowItem(title: suggestion.city.name, subtitle: suggestion.code)
                            }.foregroundColor(.black)
                        }
                    }
                }
                
                
            }.navigationBarTitle(Text("Select departure airport"))
            .listStyle(GroupedListStyle())
            .onAppear(perform: {
                self.locationsBffProvider.getAutocomplete(phrase: "")
                self.areThereSuggestions = true
            })
            
        }
    }
    
}

struct DepartureAirportSelectionView_Previews: PreviewProvider {
    
    static var locationsTest = LocationBffProvider()
    static var selectedAirports = TripDetails()
    
    static var previews: some View {
        DepartureAirportSelectionView().environmentObject(locationsTest)
            .environmentObject(selectedAirports)
    }
}
