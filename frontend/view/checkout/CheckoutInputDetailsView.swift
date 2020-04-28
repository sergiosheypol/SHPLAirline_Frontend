//
//  CheckoutInputDetailsView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 23/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct CheckoutInputDetailsView: View {
    
    private let bookingService = BookingService()
    
    @EnvironmentObject var userDetails: UserDetails
    @EnvironmentObject var bookingDetails: BookingDetails
    @EnvironmentObject var viewsManager: ViewsManager
    
    @State private var isBookingSuccesful = false
    
    @State var creditCard = ""

    var body: some View {
        List{
            UserDetailsView()
            
            Section(header: Text("Credit card")) {
                TextField("Type your credit card", text: $creditCard)
            }
            
            Button(action: {
                self.bookFlights()
                self.displayAlerts()
            }) {
                Text("Book")
            }
            .alert(isPresented: $isBookingSuccesful) {
                Alert(title: Text("Booked succesfully"), message: Text("Enjoy your flight!"), dismissButton: .default(Text("Perfect!")))
            }
            
            
        }.listStyle(GroupedListStyle())
        .navigationBarTitle("Confirm booking")
        
    }
    
    func bookFlights() {
        self.bookingDetails.departureFlightPnr = self.bookingService.bookFlight(fareOpt: self.bookingDetails.departureFlight!, user: self.userDetails.userProfile!)
        self.bookingDetails.returnFlightPnr = self.bookingService.bookFlight(fareOpt: self.bookingDetails.returnFlight!, user: self.userDetails.userProfile!)
        self.bookingDetails.departureFlight = nil
        self.bookingDetails.returnFlight = nil
    }
    
    func displayAlerts()  {
        if(self.bookingDetails.departureFlightPnr != nil && self.bookingDetails.returnFlightPnr != nil) {
            self.isBookingSuccesful = true
        }
    }
}

struct CheckoutInputDetailsView_Previews: PreviewProvider {
    static let userDetailsStatic = UserDetails()
    
    static var previews: some View {
        CheckoutInputDetailsView()
            .environmentObject(userDetailsStatic)
    }
}
