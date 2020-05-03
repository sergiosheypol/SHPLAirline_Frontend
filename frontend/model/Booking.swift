//
//  Booking.swift
//  frontend
//
//  Created by Sergio López on 03/05/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct Booking: Codable, Hashable {
    var flightId: String
    var iataCode: String
    var pnr: String
    var departureAirportName: String
    var arrivalAirportName: String
    var departureDate: Date
    var arrivalDate: Date
    var price: String
    
    static let bookingExample = Booking(flightId: "FR5932~MAD~STN~2020-05-28 16:50:00 +0000",
                                        iataCode: "FR5932",
                                        pnr: "ETRX78",
                                        departureAirportName: "Madrid",
                                        arrivalAirportName: "London",
                                        departureDate: Date.init(),
                                        arrivalDate: Date.init(),
                                        price: "78.98EUR")
}
