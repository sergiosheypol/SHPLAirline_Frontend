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
    var departureDate: String
    var arrivalDate: String
    var price: Price
}

struct Price: Codable, Hashable {
    var base: PriceItem
    var adjustment: PriceItem
}

struct PriceItem: Codable, Hashable {
    var currencyCode: String
    var value: String
}
