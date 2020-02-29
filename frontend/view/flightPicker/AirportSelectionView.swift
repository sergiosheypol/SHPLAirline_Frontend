//
//  FlightPickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct AirportSelectionView: View {
    
    @EnvironmentObject var shplBffProvider: ShplBffProvider
    @EnvironmentObject var tripDetails: TripDetails
    @EnvironmentObject var viewsManager: ViewsManager
    
    @State var autocompletePhrase = ""
    
    let viewName: FlightType
    
    var body: some View {
        
        List {
            Section {
                TextField("",text: $autocompletePhrase)
                Button(action: {
                    self.shplBffProvider.getAutocomplete(phrase: self.autocompletePhrase)
                    print(self.shplBffProvider.getSuggestions())
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
                ForEach(shplBffProvider.getSuggestions(), id: \.self) { suggestion in
                    GenericRowItemView(
                        title: suggestion.city.name,
                        subtitle: "\(suggestion.code)")
                        .onTapGesture {
                            self.saveSelection(suggestion: suggestion)
                            self.viewsManager.selected = 0
                    }
                }
            }
        }
        .navigationBarTitle(Text("Select \(viewName.rawValue.lowercased()) airport"), displayMode: .inline)
        .listStyle(GroupedListStyle())
        .onAppear(perform: {
            self.shplBffProvider.getAutocomplete(phrase: "")
        })
    }
    
    func checkIfAirportExists() -> Bool {
        
        let airport: Airport?
        
        switch viewName {
        case FlightType.DEPARTURE:
            airport = tripDetails.departureAirport
        case FlightType.RETURN:
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
        case FlightType.RETURN:
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
        case FlightType.RETURN:
            self.tripDetails.arrivalAirport = self.configureAirportFromSuggestion(suggestion: suggestion)
            self.tripDetails.cityTo = self.configureCityFromSuggestion(suggestion: suggestion)
        }
    }
    
}

struct ArrivalAirportSelectionView_Previews: PreviewProvider {
    
    static var shplBffProvider = ShplBffProvider()
    static var tripDetails = TripDetails()
    static var viewsManager = ViewsManager()
    
    
    static var previews: some View {
        AirportSelectionView(viewName: FlightType.DEPARTURE)
            .environmentObject(tripDetails)
            .environmentObject(shplBffProvider)
            .environmentObject(viewsManager)
    }
}
