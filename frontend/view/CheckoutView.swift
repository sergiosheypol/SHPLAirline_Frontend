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
            CheckoutListView()
        }
        
    }

}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
