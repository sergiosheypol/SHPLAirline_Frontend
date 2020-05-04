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
    private let shplFlightMgmtProvider = ShplFlightMgmtProvider()
        
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
        let dateId = self.formatDateId(date: fare.departureDate)
        
        let flightId = "\(fare.flightNumber)\(fare.departureAirport)\(fare.arrivalAirport)\(dateId)"
        
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
    
    func getFlights(userId: String) -> [Booking] {
        guard let bookingsDto = shplBookingMgmtProvider.getBookings(userId: userId) else {
            return []
        }
        
        var bookings: [Booking] = []
        
        for (flightId, booking) in bookingsDto.bookings {
                        
            guard let flight = shplFlightMgmtProvider.getFlightDetails(flightId: flightId) else {
                continue
            }

            
            let booking = Booking(flightId: flightId,
                                  iataCode: flight.iataCode,
                                  pnr: booking.pnr,
                                  departureAirportName: flight.departureAirport,
                                  arrivalAirportName: flight.arrivalAirport,
                                  departureDate: stringToDate(dateStg: flight.departureDate),
                                  arrivalDate: stringToDate(dateStg: flight.arrivalDate),
                                  price: booking.price)
            
            bookings.append(booking)
            
        }
        
        
        return bookings
        
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        
        return formatter.string(from: date)
    }
    
    private func formatDateId(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmm"
        
        return formatter.string(from: date)
    }
    
    private func stringToDate(dateStg: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        print(dateStg)

        return formatter.date(from: dateStg)!
        
    }
    
    
    
}
