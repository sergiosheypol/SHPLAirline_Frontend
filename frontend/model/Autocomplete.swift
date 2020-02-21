//
//  Autocomplete.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct Autocomplete: Codable, Hashable {
    var code: String
    var city: City
    var country: Country
}
