//
//  LocationBffProvider.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation
import Apollo

class LocationBffProvider: ObservableObject {
    
    private let endpoint = "http://localhost:3000/graphql"
    private let locationsBffClient: ApolloClient
    
    @Published private var airports: [Airport] = [Airport]()
    
    @Published private var autocompletedAirports: [Autocomplete] = [Autocomplete]()
    
    
    init() {
        locationsBffClient = ApolloClient(url: URL(string: self.endpoint)!)
    }
    
    func getAirports() -> [Airport] {
        return self.airports
    }
    
    func getSuggestions() -> [Autocomplete] {
        return self.autocompletedAirports
    }
    
    
    func getAllAirports() {
        locationsBffClient.fetch(query: GetAllAirportsQuery()) { result in
            switch result {
            case .failure(let error):
                print("Something bad happened \(error)")
            case .success(let result):
                if let airports = self.mapAllAirports(graphQLResult: result) {
                    self.airports = airports
                    print("Airports list downloaded")
                }
            }
        }
    }
    
    func getAutocomplete(phrase: String) {
        
        locationsBffClient.fetch(query: GetAutocompleteQuery(phrase: phrase)) { result in
            switch result {
            case .failure(let error):
                print("Something bad happened \(error)")
            case .success(let result):
                if let suggestions = self.mapAutocomplete(graphQLResult: result) {
                    self.autocompletedAirports = suggestions
                    print("Airport suggestions downloaded")
                }
            }
            
        }
    }
    
    
    func mapAutocomplete(graphQLResult: GraphQLResult<GetAutocompleteQuery.Data>) -> [Autocomplete]? {
        guard let data = graphQLResult.data?.autocomplete else {
            print("Couldn't decode data from GraphQL")
            return nil
        }
                
        var suggestions: [Autocomplete] = []
        
        for autocomplete in data {
            let city = City(code: autocomplete!.city!.code!,
                            name: autocomplete!.city!.name!,
                            countryCode: autocomplete!.city!.countryCode!)
            
            let country = Country(code: autocomplete!.country!.code!,
                                  name: autocomplete!.country!.name!,
                                  currency: autocomplete!.country!.currency!,
                                  defaultAirportCode: autocomplete!.country!.defaultAirportCode!)
            
            suggestions.append(Autocomplete(code: autocomplete!.code!, city: city, country: country))
        }
        
        return suggestions
    }
    
    

    
    func mapAllAirports(graphQLResult: GraphQLResult<GetAllAirportsQuery.Data>) -> [Airport]? {
        guard let data = graphQLResult.data?.airports else {
            print("Couldn't decode data from GraphQL")
            return nil
        }
        
        var airports: [Airport] = []
    
        for airport in data {
            airports.append(Airport(iataCode: airport!.iataCode!,
                                    name: airport!.name!,
                                    seoName: airport!.seoName!,
                                    countryCode: airport!.countryCode!,
                                    regionCode: airport!.regionCode!,
                                    cityCode: airport!.cityCode!,
                                    currencyCode: airport!.currencyCode!))
        }
        
        return airports
    }
    
    
}
