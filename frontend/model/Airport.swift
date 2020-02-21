//
//  Airport.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct Airport: Codable, Hashable {
    var iataCode: String
    var name: String
    var seoName: String
    var countryCode: String
    var regionCode: String
    var cityCode: String
    var currencyCode: String
    
    static let example = Airport(iataCode: "MAD", name: "Madrid", seoName: "madrid", countryCode: "es", regionCode: "MADRID", cityCode: "MADRID", currencyCode: "EUR")
    
    static let defaultAirport = Airport(iataCode: "", name: "", seoName: "", countryCode: "", regionCode: "", cityCode: "", currencyCode: "")
}
