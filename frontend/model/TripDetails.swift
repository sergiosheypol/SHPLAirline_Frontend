//
//  SelectedAirports.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

class TripDetails: ObservableObject {
    @Published private var departureAirport: Airport?
    @Published private var arrivalAirport: Airport?
    @Published private var cityFrom: City?
    @Published private var cityTo: City?
    
    func getDepartureAirport() -> Airport {
        if let airport = departureAirport {
            return airport
        }
        return Airport.defaultAirport
    }
    
    func setDepartureAirport(airport: Airport) {
        self.departureAirport = airport
    }
    
    func getArrivalAirport() -> Airport {
        if let airport = arrivalAirport {
            return airport
        }
        return Airport.defaultAirport
    }
    
    func setArrivalAirport(airport: Airport) {
        self.arrivalAirport = airport
    }
    
    func getCityFrom() -> City {
        if let city = cityFrom {
            return city
        }
        
        return City.defaultCity
    }
    
    func setCityFrom(city: City) {
        self.cityFrom = city
    }
    
    
    func getCityTo() -> City {
        if let city = cityTo {
            return city
        }
        
        return City.defaultCity
    }
    
    func setCityTo(city: City) {
        self.cityTo = city
    }
        
    
}
