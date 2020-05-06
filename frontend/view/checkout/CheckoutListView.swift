//
//  CheckoutListView.swift
//  frontend
//
//  Created by Sergio López on 06/05/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct CheckoutListView: View {
    
    @EnvironmentObject var viewsManager: ViewsManager
    @EnvironmentObject var bookingDetails: BookingDetails
    @EnvironmentObject var tripDetails: TripDetails
    @EnvironmentObject var userDetails: UserDetails
    
    private let bookingService = BookingService()
    
    var body: some View {
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
                LoginView()
            }
            
            
            
        }
        .navigationBarTitle(Text("Confirm your selection"))
        .listStyle(GroupedListStyle())
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

struct CheckoutListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutListView()
    }
}
