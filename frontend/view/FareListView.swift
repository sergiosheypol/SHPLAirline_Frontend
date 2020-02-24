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
    
    var body: some View {
        
        List{
            ForEach(shplBffProvider.getDepartureFlights(), id: \.self) { fare in
                GenericRowItemView(title: fare.flightNumber, subtitle: fare.departureDate)
            }
        }
        .onAppear(perform: {self.callFareProvider()})
        .navigationBarTitle(Text("Available departure flights"), displayMode: .inline)
    }
    
    func callFareProvider() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let depDate = formatter.string(from: tripDetails.departureDate)
        let arrDate = formatter.string(from: tripDetails.arrivalDate)
        
        shplBffProvider.getAvailableFares(farefinderDto: FarefinderDto(
            departureDateFrom: depDate,
            departureDateTo: arrDate,
            arrivalAirport: tripDetails.arrivalAirport?.iataCode,
            departureAirport: tripDetails.departureAirport?.iataCode,
            currencyCode: tripDetails.departureAirport?.currencyCode))
        
        
    }
}

struct FareListView_Previews: PreviewProvider {
    static var previews: some View {
        FareListView()
    }
}