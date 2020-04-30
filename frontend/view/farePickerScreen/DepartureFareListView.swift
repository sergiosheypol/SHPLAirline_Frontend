//
//  FareListView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 24/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct DepartureFareListView: View {
    
    @EnvironmentObject var shplBffProvider: ShplBffProvider
    @EnvironmentObject var tripDetails: TripDetails
    @EnvironmentObject var bookingDetails: BookingDetails
    
    @State var isFaresEmpty : Bool = false
        
    var body: some View {
        
        List{
            
            if checkIfFareHasBeenSelected() {
                SelectedFlightView(fare: bookingDetails.departureFlight!,
                                   cityFrom: tripDetails.cityFrom!,
                                   cityTo: tripDetails.cityTo!,
                                   flightType: FlightType.DEPARTURE)
            }
            
            NavigationLink(destination: ReturnFareListView()) {
                    Text("Choose return flight")
            }
            
            FareListView(flightType: FlightType.DEPARTURE)
            
        }
        .onAppear(perform: {
            self.callFareProvider()
            
        }).navigationBarTitle(Text("Available departure flights"), displayMode: .inline)
    
    }
    
    
    func checkIfFareHasBeenSelected() -> Bool {
        if bookingDetails.departureFlight != nil {
            return true
        }
        return false
        
    }

    func callFareProvider() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let depDate = formatter.string(from: tripDetails.departureDate)
        
        getDepartureFlightDto(depDate: depDate)
        
    }
    
    func getDepartureFlightDto(depDate: String) {
        shplBffProvider.getAvailableFares(farefinderDto: FarefinderDto(
            departureDateFrom: depDate,
            departureDateTo: depDate,
            arrivalAirport: tripDetails.arrivalAirport?.iataCode,
            departureAirport: tripDetails.departureAirport?.iataCode,
            currencyCode: tripDetails.departureAirport?.currencyCode))
    }

}

//struct FareListView_Previews: PreviewProvider {
//
//    static let shplBffProvider = ShplBffProvider()
//    static let tripDetails = TripDetails()
//
//    static var previews: some View {
//        DepartureFareListView()
//            .environmentObject(shplBffProvider)
//            .environmentObject(tripDetails)
//    }
//}
