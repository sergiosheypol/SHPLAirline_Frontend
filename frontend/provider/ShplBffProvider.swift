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
    
    private let endpoint = "http://localhost:3000/graphql"
    private let shplBffClient: ApolloClient
        
    @Published private var autocompletedAirports: [Autocomplete] = [Autocomplete]()
//    @Published private var departureFlights: [Fare] = [Fare]()
    @Published private var departureFlights: [String : [Fare]] = [:]

    
    
    init() {
        shplBffClient = ApolloClient(url: URL(string: self.endpoint)!)
    }
    
    func getSuggestions() -> [Autocomplete] {
        return self.autocompletedAirports
    }
    
    func getDepartureFlights() -> [String : [Fare]] {
        return self.departureFlights
    }
    
    func getDepartureFlightsKeys() -> [String] {
        
        var keys = Array(self.departureFlights.keys)
        
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        
        var dates : [Date] = []
        
        for dateString in keys {
            dates.append(df.date(from: dateString)!)
        }
        
        dates = dates.sorted()
        
        keys = []
        
        for date in dates {
            keys.append(df.string(from: date))
        }
        
        return keys
    }
    
    func getFaresForKey(key: String) -> [Fare] {
        return departureFlights[key]!
    }

    
    func getAutocomplete(phrase: String) {
        
        shplBffClient.fetch(query: GetAutocompleteQuery(phrase: phrase)) { result in
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
    
    func getAvailableFares(farefinderDto: FarefinderDto) {
        shplBffClient.fetch(query: GetFaresQuery(dto: farefinderDto)) { result in
            switch result {
            case .failure(let error):
                print("Something bad happened \(error)")
            case .success(let result):
                
                if let fares = self.mapAvailableFares(graphQLResult: result) {
                    self.departureFlights = fares
                    print("Departure flight fares downloaded")
                }
                                
            }
        }
    }
    
    func mapAvailableFares(graphQLResult: GraphQLResult<GetFaresQuery.Data>) -> [String : [Fare]]? {
        guard let data = graphQLResult.data?.fares else {
            print("Couldn't decode data from GraphQL")
            return nil
        }
        
        var fares: [String : [Fare]] = [:]
        
        for fareOpt in data {
            guard let fare = fareOpt else {
                break
            }
            
            guard let price = fare.price else {
                break
            }
            
            let base = PriceItem(currencyCode: price.base!.currencyCode!,
                                 value: price.base!.value!)
            
            let adjustment : PriceItem
            
            if let adjustmentOpt = price.adjustment {
                adjustment = PriceItem(currencyCode: adjustmentOpt.currencyCode!, value: adjustmentOpt.value!)
            } else {
                adjustment = PriceItem(currencyCode: "", value: "")
            }

            let priceModel = Price(base: base, adjustment: adjustment)
            
            let connectingAirport : String
            
            if let connectingAirportOpt = fare.connectingAirport  {
                connectingAirport = connectingAirportOpt
            } else {
                connectingAirport = ""
            }
            
            let fullDateFormatter = DateFormatter()
            fullDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
            
            let depDate = fullDateFormatter.date(from: fare.departureDate!)!
            let arrDate = fullDateFormatter.date(from: fare.arrivalDate!)!

            let fareModel = Fare(flightNumber: fare.flightNumber!,
                            departureAirport: fare.departureAirport!,
                            arrivalAirport: fare.arrivalAirport!,
                            connectingAirport: connectingAirport,
                            departureDate: depDate,
                            arrivalDate: arrDate,
                            price: priceModel)
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            
            let currentDateKey = dateFormatter.string(from: depDate)
                        
            if var currentFares = fares[currentDateKey] {
                currentFares.append(fareModel)
                fares.updateValue(currentFares, forKey: currentDateKey)
            } else {
                fares.updateValue([fareModel], forKey: currentDateKey)
            }
            
        }
        
        return fares
    }

    
}
