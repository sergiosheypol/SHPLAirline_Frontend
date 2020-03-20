//
//  User.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct User: Codable, Hashable{
    var dni: String
    var name: String
    var email: String
    var gender: String
    var phone: String
    var age: String
}

struct Data: Codable, Hashable {
    var data: [String:User]
}
