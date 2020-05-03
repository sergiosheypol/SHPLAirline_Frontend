//
//  BookingsDto.swift
//  frontend
//
//  Created by Sergio López on 03/05/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct BookingsDto: Codable, Hashable {
    var id: String
    var bookings: [String:BookingDto]
}


struct BookingDto: Codable, Hashable {
    var pnr: String
    var price: String
    var dateOfBooking: String
}
