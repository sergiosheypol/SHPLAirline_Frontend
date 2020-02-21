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
    
    init() {
        locationsBffClient = ApolloClient(url: URL(string: self.endpoint)!)
    }
    
    func getAirports() -> [Airport] {
        return self.airports
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
