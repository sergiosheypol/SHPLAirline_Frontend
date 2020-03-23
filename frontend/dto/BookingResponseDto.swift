//
//  BookingResponseDto.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 23/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct BookingResponseDto: Codable, Hashable {
    var userId: String
    var pnr: String
}
