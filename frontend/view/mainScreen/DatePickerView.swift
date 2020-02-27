//
//  DatePickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 23/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct DatePickerView: View {
    
    @EnvironmentObject var tripDetails: TripDetails
    
    let viewName: FlightType

    
    var body: some View {
        VStack {
            DatePicker(selection: setDateVariable(), displayedComponents: .date) {
                Text("")
            }.padding(30)
        }
    }
    
    func setDateVariable() -> Binding<Date> {
        switch viewName {
        case FlightType.DEPARTURE:
            return $tripDetails.departureDate
        case FlightType.ARRIVAL:
            return $tripDetails.returnDate
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    
    static var tripDetails = TripDetails()
    
    static var previews: some View {
        DatePickerView(viewName: FlightType.DEPARTURE).environmentObject(tripDetails)
    }
}
