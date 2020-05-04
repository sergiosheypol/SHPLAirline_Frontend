//
//  ShplFlightMgmtProvider.swift
//  frontend
//
//  Created by Sergio López on 04/05/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

class ShplFlightMgmtProvider {
    private let endpointsProvider = EndpointsProvider()
    private let saveNewBookingEndpoint = "/flight/getFlight/"
    
    func getFlightDetails(flightId: String) -> FlightResponseDto? {
        let semaphore = DispatchSemaphore (value: 0)
        let endpoint = "\(self.endpointsProvider.flightManager!)\(self.saveNewBookingEndpoint)\(flightId)"
        
        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "GET"
        
        var flightResponseDto: FlightResponseDto?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            if let flightOpt = try? JSONDecoder().decode(FlightResponseDto.self, from: data) {
                flightResponseDto = flightOpt
                print("Flight with ID {\(flightId)} decoded successfully")
            } else {
                print("Error while decoding flight {\(flightId)}")
            }
        
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return flightResponseDto
        
    }
}
