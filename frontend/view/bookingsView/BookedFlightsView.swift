//
//  BookedFlightsView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 26/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct BookedFlightsView: View {
    
    
    @EnvironmentObject var userDetails: UserDetails
    private let bookingService = BookingService()
    
    var userId: String
    
    var body: some View {
        List{
            ForEach(self.getBookings(), id: \.self) { booking in
                Section {
                    BookingItemView(booking: booking)
                }
            }
            
            Section {
                Button(action: {
                    self.userDetails.bookings = nil
                    self.getBookings()
                }) {
                    Text("Update bookings")
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text("Bookings"))
    }
    
    func getBookings() -> [Booking] {
        if self.userDetails.bookings == nil {
            self.userDetails.bookings = self.bookingService.getFlights(userId: self.userId)
        }
        
        if let bookings = self.userDetails.bookings {
            return bookings
        }
        
        return []
    }
    
}

//struct BookedFlightsView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookedFlightsView()
//    }
//}
