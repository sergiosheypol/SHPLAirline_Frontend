//
//  Endpoints.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation


class EndpointsProvider {
    var bff: String?
    var users: String?
    var apiKey: String?
    
    init() {
        guard let endpointsPlist = Bundle.main.path(forResource: "Endpoints", ofType: "plist") else {
            print("Endpoints couldn't be decoded")
            return
        }
        
        if let endpointsDict = NSDictionary(contentsOfFile: endpointsPlist) as? [String:String] {
            apiKey = endpointsDict["apiKey"]
            bff = endpointsDict["bff"]
            users = endpointsDict["users"]
            return
        }
    
    }
    
}
