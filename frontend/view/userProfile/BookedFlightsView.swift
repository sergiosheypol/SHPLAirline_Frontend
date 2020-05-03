//
//  BookedFlightsView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 26/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct BookedFlightsView: View {
    
       private let bookingService = BookingService()
    
        var userId: String
        
    var body: some View {
//        Section(header: Text("Bookings")){
//            Text("Booked flights section")
//        }
        
        
        ForEach(bookingService.getFlights(userId: userId), id: \.self) { booking in
            BookingItemView(booking: booking)
        }
        
    }
}

//struct BookedFlightsView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookedFlightsView()
//    }
//}
