//
//  FareList.swift
//  frontend
//
//  Created by Sergio López on 30/04/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct FareListView: View {
    
    @EnvironmentObject var shplBffProvider: ShplBffProvider
    @EnvironmentObject var tripDetails: TripDetails
    
    var flightType: FlightType
    
    var body: some View {
        Section(header:Text("Available \(flightType.rawValue.lowercased()) fares")) {
            ForEach(shplBffProvider.getFares(), id: \.self) { fare in
                FareRowDetailView(
                    fare: fare,
                    cityFrom: self.setDepartureCity(),
                    cityTo: self.setReturnCity(),
                    flightType: self.flightType)
            }
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
}

//struct FareList_Previews: PreviewProvider {
//    static var previews: some View {
//        FareList()
//    }
//}
