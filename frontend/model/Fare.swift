//
//  Fare.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 24/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation




struct Fare: Codable, Hashable {
    var flightNumber: String
    var departureAirport: String
    var arrivalAirport: String
    var connectingAirport: String
    var departureDate: Date
    var arrivalDate: Date
    var price: Price
    
    static let fareExample = Fare(flightNumber: "FRXXXX",
                                  departureAirport: "IBZ",
                                  arrivalAirport: "MAD",
                                  connectingAirport:"",
                                  departureDate: Date.init(),
                                  arrivalDate: Date.init(),
                                  price: Price(base: PriceItem(currencyCode: "EUR", value: "90"),
                                               adjustment: PriceItem(currencyCode: "", value: "")))
}

struct Price: Codable, Hashable {
    var base: PriceItem
    var adjustment: PriceItem
}

struct PriceItem: Codable, Hashable {
    var currencyCode: String
    var value: String
}


