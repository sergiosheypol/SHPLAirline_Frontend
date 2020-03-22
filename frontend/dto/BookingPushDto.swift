//
//  BookingPushDto.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 22/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct BookingPushDto: Codable, Hashable {
    var userId: String
    var price: String
    var flightDto: FlightDto
}

struct FlightDto: Codable, Hashable {
    var id: String
    var iataCode: String
    var departureAirport: String
    var arrivalAirport: String
    var connectingAirport: String
    var departureDate: String
    var arrivalDate: String
}
