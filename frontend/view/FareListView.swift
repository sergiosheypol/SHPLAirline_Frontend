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
            ForEach(self.shplBffProvider.getDepartureFlightsKeys(), id: \.self) { key in
                Section(header: Text(key)) {
                    ForEach(self.shplBffProvider.getFaresForKey(key: key), id: \.self) { fare in
                        FareRowDetailView(fare: fare, cityFrom: self.tripDetails.cityFrom!, cityTo: self.tripDetails.cityTo!)
                    }
                }
            }
            }.listStyle(GroupedListStyle())
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
    
    static let shplBffProvider = ShplBffProvider()
    static let tripDetails = TripDetails()
    
    static var previews: some View {
        FareListView()
            .environmentObject(shplBffProvider)
            .environmentObject(tripDetails)
    }
}
