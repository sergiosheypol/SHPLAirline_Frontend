//
//  FareListView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 24/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct ReturnFareListView: View {
    
    @EnvironmentObject var shplBffProvider: ShplBffProvider
    @EnvironmentObject var tripDetails: TripDetails
    @EnvironmentObject var bookingDetails: BookingDetails
    
    @State var isFaresEmpty : Bool = false
        
    var body: some View {
        
        List{
            
            if checkIfFareHasBeenSelected() {
                SelectedFlightView(fare: bookingDetails.returnFlight!,
                               cityFrom: tripDetails.cityFrom!,
                               cityTo: tripDetails.cityTo!,
                               flightType: FlightType.RETURN)
            }
        
            FareListView(flightType: FlightType.RETURN)
            
        }
        .onAppear(perform: {
            self.callFareProvider()
        }).navigationBarTitle(Text("Available return flights"), displayMode: .inline)
    
    }

    
    
    func checkIfFareHasBeenSelected() -> Bool {
        if bookingDetails.returnFlight != nil {
            return true
        }
        return false
        
    }
    
    func callFareProvider() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let retDate = formatter.string(from: tripDetails.returnDate)
        
        getReturnFlightDto(retDate: retDate)
    
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
