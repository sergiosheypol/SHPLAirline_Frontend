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
    
    @State var creditCard = ""

    var body: some View {
        List{
            UserDetailsView()
            
            Section(header: Text("Credit card")) {
                TextField("Type your credit card", text: $creditCard)
            }
            
            Button(action: {
                let pnrDeparture = self.bookingService.bookFlight(fareOpt: self.bookingDetails.departureFlight!, user: self.userDetails.userProfile!)
                let pnrReturn = self.bookingService.bookFlight(fareOpt: self.bookingDetails.returnFlight!, user: self.userDetails.userProfile!)
                
                print(pnrDeparture, pnrReturn)
            }) {
                Text("Book")
            }
        }.listStyle(GroupedListStyle())
        .navigationBarTitle("Confirm booking")
        
    }
}

struct CheckoutInputDetailsView_Previews: PreviewProvider {
    static let userDetailsStatic = UserDetails()
    
    static var previews: some View {
        CheckoutInputDetailsView()
            .environmentObject(userDetailsStatic)
    }
}
