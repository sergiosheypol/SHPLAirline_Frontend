//
//  UserDetailsView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    
    @EnvironmentObject var userDetails: UserDetails
    
    var body: some View {
        
        
        
        List{
            Section(header: Text("Personal data")){
                HStack{
                    Image(systemName: "person")
                    if userDetails.userProfile != nil {
                       Text(userDetails.userProfile!.name)
                    }
                }
                HStack{
                    Image(systemName: "creditcard")
                    if userDetails.userProfile != nil {
                       Text(userDetails.userProfile!.dni)
                    }
                }
                HStack{
                    Image(systemName: "at")
                    if userDetails.userProfile != nil {
                       Text(userDetails.userProfile!.email)
                    }
                }
                HStack{
                    Image(systemName: "phone")
                    if userDetails.userProfile != nil {
                       Text(userDetails.userProfile!.phone)
                    }
                }
            
            }
            
            Section(header: Text("Bookings")) {
                Text("Not retrieved yet")
            }
        }
        
        
        
        
    }
  
    

}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
    }
}
