//
//  FareListView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 24/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct FareListView: View {
    
    @EnvironmentObject var shplBffProvider: ShplBffProvider
    @EnvironmentObject var tripDetails: TripDetails
    @EnvironmentObject var bookingDetails: BookingDetails
    @EnvironmentObject var viewsManager: ViewsManager
    
    @State var isFaresEmpty : Bool = false
    
    let flightType : FlightType
    
    var body: some View {
        
        List{
            
            if checkIfFareHasBeenSelected() {
                Section(header: Text("Selected flight")) {
                    displaySelection()
                }
                
            }
            
            Section(header:Text("Available \(flightType.rawValue.lowercased()) fares")) {
                ForEach(shplBffProvider.getFares(), id: \.self) { fare in
                    FareRowDetailView(
                        fare: fare,
                        cityFrom: self.setDepartureCity(),
                        cityTo: self.setReturnCity(),
                        flightType: self.flightType)
                }
            }
            
            if(flightType == FlightType.DEPARTURE) {
                NavigationLink(
                    destination: FareListView(flightType: FlightType.RETURN),
                    tag: 11,
                    selection: $viewsManager.selected) {
                        Text("Choose return flight")
                }
            }
            
        }
        .onAppear(perform: {
            self.callFareProvider()
            
        }).navigationBarTitle(Text("Available \(flightType.rawValue.lowercased()) flights"), displayMode: .inline)

        
        
    }
    
    func checkIfFareHasBeenSelected() -> Bool {
        switch flightType {
        case FlightType.DEPARTURE:
            if bookingDetails.departureFlight != nil {
                return true
            }
            return false
        case FlightType.RETURN:
            if bookingDetails.returnFlight != nil {
                return true
            }
            
            return false
        }
    }
    
    func displaySelection() -> FareRowDetailView {
        switch flightType {
        case FlightType.DEPARTURE:
            return FareRowDetailView(
                fare: bookingDetails.departureFlight!,
                cityFrom: tripDetails.cityFrom!,
                cityTo: tripDetails.cityTo!,
                flightType: FlightType.DEPARTURE)
        case FlightType.RETURN:
            return FareRowDetailView(
                fare: bookingDetails.returnFlight!,
                cityFrom: tripDetails.cityFrom!,
                cityTo: tripDetails.cityTo!,
                flightType: FlightType.RETURN)
        }
    }
    
    func callFareProvider() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let depDate = formatter.string(from: tripDetails.departureDate)
        let retDate = formatter.string(from: tripDetails.returnDate)
        
        switch flightType {
        case FlightType.DEPARTURE:
            getDepartureFlightDto(depDate: depDate)
        case FlightType.RETURN:
            getReturnFlightDto(retDate: retDate)
        }
        
    }
    
    func setDepartureCity() -> City {
        switch flightType {
        case FlightType.DEPARTURE:
            return tripDetails.cityFrom!
        case FlightType.RETURN:
            return tripDetails.cityTo!
        }
    }
    
    func setReturnCity() -> City {
        switch flightType {
        case FlightType.DEPARTURE:
            return tripDetails.cityTo!
        case FlightType.RETURN:
            return tripDetails.cityFrom!
        }
    }
    
    func getDepartureFlightDto(depDate: String) {
        shplBffProvider.getAvailableFares(farefinderDto: FarefinderDto(
            departureDateFrom: depDate,
            departureDateTo: depDate,
            arrivalAirport: tripDetails.arrivalAirport?.iataCode,
            departureAirport: tripDetails.departureAirport?.iataCode,
            currencyCode: tripDetails.departureAirport?.currencyCode))
    }
    
    func getReturnFlightDto(retDate: String) {
        shplBffProvider.getAvailableFares(farefinderDto: FarefinderDto(
            departureDateFrom: retDate,
            departureDateTo: retDate,
            arrivalAirport: tripDetails.departureAirport?.iataCode,
            departureAirport: tripDetails.arrivalAirport?.iataCode,
            currencyCode: tripDetails.departureAirport?.currencyCode))
    }
}

struct FareListView_Previews: PreviewProvider {
    
    static let shplBffProvider = ShplBffProvider()
    static let tripDetails = TripDetails()
    
    static var previews: some View {
        FareListView(flightType: FlightType.DEPARTURE)
            .environmentObject(shplBffProvider)
            .environmentObject(tripDetails)
    }
}
