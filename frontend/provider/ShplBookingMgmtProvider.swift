//
//  ShplBookingMgmtProvider.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 22/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation


class ShplBookingMgmtProvider: ObservableObject {
    
    private let endpointsProvider = EndpointsProvider()
    private let saveNewBookingEndpoint = "/booking/saveBooking"
    private let getBookingsEndpoint = "/booking/getBookings/"
    
    func saveNewBooking(bookingPushDto: BookingPushDto) -> String? {
        
        let endpoint = "\(self.endpointsProvider.bookingManager!)\(self.saveNewBookingEndpoint)"
        
        let semaphore = DispatchSemaphore (value: 0)
        
        let paramsJson = try! JSONEncoder().encode(bookingPushDto)
        
        let parameters = String(data: paramsJson, encoding: .utf8)!
        
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        var pnr: String?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            //            print(String(data: data, encoding: .utf8)!)
            
            pnr = try! JSONDecoder().decode(BookingResponseDto.self, from: data).pnr
            
            print("Booking confirmed with pnr {\(pnr)}")
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return pnr
        
        
    }
    
    func getBookings(userId: String) -> BookingsDto? {
        
        let endpoint = "\(self.endpointsProvider.bookingManager!)\(self.getBookingsEndpoint)\(userId)"
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "GET"
        
        var bookings: BookingsDto?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            if let bookingsOpt = try? JSONDecoder().decode(BookingsDto.self, from: data) {
                bookings = bookingsOpt
                print("Bookings from user {\(userId)} decoded successfully")
            } else {
                print("Error while decoding bookings from user {\(userId)}")
            }
                        
            //            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return bookings
        
    }
}
