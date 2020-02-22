//
//  FlightPickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct AirportSelectionView: View {
    
    @EnvironmentObject var locationsBffProvider: LocationBffProvider
    @EnvironmentObject var tripDetails: TripDetails
    @EnvironmentObject var viewController: ViewController
    
    @State var autocompletePhrase = ""
        
    let viewName: FlightType
    
    var body: some View {
        
        List {
            Section {
                TextField("",text: $autocompletePhrase)
                Button(action: {
                    self.locationsBffProvider.getAutocomplete(phrase: self.autocompletePhrase)
                    print(self.locationsBffProvider.getSuggestions())
                }) {
                    Text("Search for airports")
                }
            }
            
            
            if checkIfAirportExists() {
                Section(header: Text("Current selection")){
                    displaySelection()
                }
            }
            
            Section(header: Text("Available airports")){
                
                ForEach(locationsBffProvider.getSuggestions(), id: \.self) { suggestion in
                    Button(action: {
                        self.saveSelection(suggestion: suggestion)
                        
                        self.viewController.selected = 0
                    }) {
                        GenericRowItemView(title: suggestion.city.name, subtitle: suggestion.code)
                    }.foregroundColor(.black)
                }
            }
        }
        .navigationBarTitle(Text("Select \(viewName.rawValue.lowercased()) airport"), displayMode: .inline)
        .listStyle(GroupedListStyle())
        .onAppear(perform: {
            self.locationsBffProvider.getAutocomplete(phrase: "")
        })
    }
    
    func checkIfAirportExists() -> Bool {
        
        let airport: Airport?
        
        switch viewName {
        case FlightType.DEPARTURE:
            airport = tripDetails.departureAirport
        case FlightType.ARRIVAL:
            airport = tripDetails.arrivalAirport
        }
        
        if airport != nil {
            return true
        }
        
        return false
    }
    
    func displaySelection() -> GenericRowItemView {
        switch viewName {
        case FlightType.DEPARTURE:
            return GenericRowItemView(title: tripDetails.cityFrom!.name, subtitle: tripDetails.departureAirport!.iataCode)
        case FlightType.ARRIVAL:
            return GenericRowItemView(title: tripDetails.cityTo!.name, subtitle: tripDetails.arrivalAirport!.iataCode)
        }
    }
    
    func configureAirportFromSuggestion(suggestion: Autocomplete) -> Airport {
        return Airport(iataCode: suggestion.code,
                       name: "",
                       seoName: "",
                       countryCode: suggestion.country.code,
                       regionCode: "",
                       cityCode: suggestion.city.code,
                       currencyCode: suggestion.country.currency)
    }
    
    func configureCityFromSuggestion(suggestion: Autocomplete) -> City {
        return City(code: suggestion.city.code,
                    name: suggestion.city.name,
                    countryCode: suggestion.city.countryCode)
    }
    
    func saveSelection(suggestion: Autocomplete) {
        switch viewName {
        case FlightType.DEPARTURE:
            self.tripDetails.departureAirport = self.configureAirportFromSuggestion(suggestion: suggestion)
            self.tripDetails.cityFrom = self.configureCityFromSuggestion(suggestion: suggestion)
        case FlightType.ARRIVAL:
            self.tripDetails.arrivalAirport = self.configureAirportFromSuggestion(suggestion: suggestion)
            self.tripDetails.cityTo = self.configureCityFromSuggestion(suggestion: suggestion)
        }
    }
    
}

struct ArrivalAirportSelectionView_Previews: PreviewProvider {
    
    static var locationsTest = LocationBffProvider()
    static var selectedAirports = TripDetails()
    
    
    static var previews: some View {
        AirportSelectionView(viewName: FlightType.DEPARTURE).environmentObject(locationsTest).environmentObject(selectedAirports)
    }
}
