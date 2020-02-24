//
//  SelectedAirports.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

class TripDetails: ObservableObject {
    @Published var departureAirport: Airport?
    @Published var arrivalAirport: Airport?
    @Published var cityFrom: City?
    @Published var cityTo: City?
    @Published var departureDate: Date = Date()
    @Published var arrivalDate: Date = Date()
    
}
