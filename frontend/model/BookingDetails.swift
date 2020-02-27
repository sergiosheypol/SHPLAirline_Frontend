//
//  BookingDetails.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 27/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

class BookingDetails: ObservableObject {
    @Published var departureFlight : Fare?
    @Published var returnFlight : Fare?
}
