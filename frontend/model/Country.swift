//
//  Country.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct Country: Codable, Hashable {
    var code: String
    var name: String
    var currency: String
    var defaultAirportCode: String
}
