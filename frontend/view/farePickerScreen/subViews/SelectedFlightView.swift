//
//  SelectedFlight.swift
//  frontend
//
//  Created by Sergio López on 30/04/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct SelectedFlightView: View {
    
    var fare: Fare
    var cityFrom: City
    var cityTo: City
    let flightType : FlightType
    
    var body: some View {
        Section(header: Text("Selected flight")) {
            FareRowDetailView(
                fare: fare,
                cityFrom: cityFrom,
                cityTo: cityTo,
                flightType: flightType)
        }
    }
}

struct SelectedFlight_Previews: PreviewProvider {
    static var previews: some View {
        SelectedFlightView(fare: Fare.fareExample, cityFrom: City.exampleCity, cityTo: City.exampleCity, flightType: FlightType.DEPARTURE)
    }
}
