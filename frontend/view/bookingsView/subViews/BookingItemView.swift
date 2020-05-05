//
//  BookingItemView.swift
//  frontend
//
//  Created by Sergio López on 03/05/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct BookingItemView: View {
    
    let booking: Booking
    
    @State private var enableBookingDetails = false
    
    var body: some View {
        VStack {
            HStack() {
                VStack(spacing: 15) {
                    Text("\(booking.departureAirportName)").font(.headline)
                    Divider()
                    formatDate(date: booking.departureDate)
                    
                }
                Spacer()
                VStack {
                    Image(systemName: "airplane")
                    Text(booking.price)
                        .font(.subheadline)
                        .foregroundColor(.green)
                    Text("\(booking.iataCode)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                Spacer()
                VStack(spacing:15) {
                    Text("\(booking.arrivalAirportName)").font(.headline)
                    Divider()
                    formatDate(date: booking.arrivalDate)
                }
                
            }
            .padding(20)
        
        }
        
        
    }
    
    func formatDate(date: Date) -> Text {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        
        return Text("\(formatter.string(from: date))").foregroundColor(.green)
        
    }
}

struct BookingItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookingItemView(booking: Booking.bookingExample)
    }
}
