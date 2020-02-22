//
//  LocationBffProvider.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation
import Apollo

class ShplBffProvider: ObservableObject {
    
    private let endpoint = "http://localhost/graphql"
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

        for autocompleteOpt in data {

            guard let autocomplete = autocompleteOpt else {
                break
            }


            let city = City(code: autocomplete.city!.code!,
                            name: autocomplete.city!.name!,
                            countryCode: autocomplete.city!.countryCode!)

            let country = Country(code: autocomplete.country!.code!,
                                  name: autocomplete.country!.name!,
                                  currency: autocomplete.country!.currency!,
                                  defaultAirportCode: autocomplete.country!.defaultAirportCode!)

            suggestions.append(Autocomplete(code: autocomplete.code!, city: city, country: country))
        }

        return suggestions
    }

    
}
