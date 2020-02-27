//
//  City.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct City: Codable, Hashable {
    var code: String
    var name: String
    var countryCode: String
    
    static let defaultCity = City(code: "", name: "", countryCode: "")
    
    static let exampleCity = City(code: "MADRID", name: "Madrid", countryCode: "ES")
}


