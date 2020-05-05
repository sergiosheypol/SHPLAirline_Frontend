//
//  BookingsView.swift
//  frontend
//
//  Created by Sergio López on 05/05/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct BookingsView: View {
    
    @EnvironmentObject var userDetails: UserDetails
    
    var body: some View {
        NavigationView{
            if(!checkIfUserExists()) {
                List{
                    LoginView()
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle(Text("Bookings"))
            } else {
                BookedFlightsView(userId: self.userDetails.userProfile!.dni)
            }
        }
    }
    
    
    func checkIfUserExists() -> Bool {
        if userDetails.userProfile != nil {
            return true
        }
        return false
    }
}

struct BookingsView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsView()
    }
}
