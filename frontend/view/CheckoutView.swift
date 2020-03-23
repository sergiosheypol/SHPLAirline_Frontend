//
//  CheckoutView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 28/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var viewsManager: ViewsManager
    @EnvironmentObject var bookingDetails: BookingDetails
    @EnvironmentObject var tripDetails: TripDetails
    @EnvironmentObject var userDetails: UserDetails
    
    private let bookingService = BookingService()
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Departure flight")) {
                    if(isDepFlightSelected()) {
                        FareRowDetailView(fare: bookingDetails.departureFlight!,
                        cityFrom: tripDetails.cityFrom!,
                        cityTo: tripDetails.cityTo!,
                        flightType: FlightType.DEPARTURE)
                    } else {
                        Text("No departure flight has been selected")
                    }
                    
                }
                Section(header: Text("Return flight")) {
                    if(isRetFlightSelected()) {
                        FareRowDetailView(fare: bookingDetails.returnFlight!,
                        cityFrom: tripDetails.cityFrom!,
                        cityTo: tripDetails.cityTo!,
                        flightType: FlightType.RETURN)
                    } else {
                        Text("No return flight has been selected")
                    }
                }
                
                
                if (isDepFlightSelected() && isRetFlightSelected() && self.bookingService.checkIfUserIsLoggedIn(user: userDetails.userProfile)) {
                    Section{
                        NavigationLink(destination: CheckoutInputDetailsView()) {
                            Text("Proceeed to checkout").foregroundColor(.red)
                        }
                    }
                } else {
                    Section{
                        Text("Select flights and login first")
                    }
                }
                
                
                
            }
            .navigationBarTitle(Text("Confirm your selection"))
            .listStyle(GroupedListStyle())
        }
        
        
        
    }
    func isDepFlightSelected() -> Bool {
        guard bookingDetails.departureFlight != nil else {
            return false
        }
        
        return true
    }
    
    func isRetFlightSelected() -> Bool {
        guard bookingDetails.returnFlight != nil else {
            return false
        }
        
        return true
    }

    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
