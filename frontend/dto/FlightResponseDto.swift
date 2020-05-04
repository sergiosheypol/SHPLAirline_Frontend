//
//  FlightResponseDto.swift
//  frontend
//
//  Created by Sergio López on 04/05/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct FlightResponseDto: Codable, Hashable {
    var id: String
    var iataCode: String
    var departureAirport: String
    var arrivalAirport: String
    var connectingAirport: String
    var departureDate: String
    var arrivalDate: String
}
