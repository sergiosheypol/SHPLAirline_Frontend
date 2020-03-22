//
//  BookingService.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 22/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

class BookingService {
    
    private let shplBookingMgmtProvider = ShplBookingMgmtProvider()
        
    func checkIfUserIsLoggedIn(user: User?) -> Bool {
        guard user != nil else {
            return false
        }
        return true
    }
    
    func bookFlight(fareOpt: Fare?, user: User) -> String? {
        
        guard let fare = fareOpt else {
            return nil
        }
        
        let price = "\(fare.price.base.value)\(fare.price.base.currencyCode)"
        let flightId = "\(fare.flightNumber)~\(fare.departureAirport)~\(fare.arrivalAirport)~\(fare.departureDate)"
        
        let flight = FlightDto(id: flightId,
                               iataCode: fare.flightNumber,
                               departureAirport: fare.departureAirport,
                               arrivalAirport: fare.arrivalAirport,
                               connectingAirport: fare.connectingAirport,
                               departureDate: self.dateToString(date: fare.departureDate),
                               arrivalDate: self.dateToString(date: fare.arrivalDate))
        
        
        let bookingPushDto = BookingPushDto(userId: user.dni,
                                            price: price,
                                            flightDto: flight)
                
        return shplBookingMgmtProvider.saveNewBooking(bookingPushDto: bookingPushDto)
        
        
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        
        return formatter.string(from: date)
    }
    
    
    
}
