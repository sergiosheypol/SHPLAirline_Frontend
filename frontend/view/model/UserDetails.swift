//
//  UserDetails.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

class UserDetails: ObservableObject {
    @Published var userProfile: User?
    @Published var bookings: [Booking]?
}
