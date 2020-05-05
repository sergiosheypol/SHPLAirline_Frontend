//
//  UserDetailsView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    
    var user: User
    
    var body: some View {
        
        Section(header: Text("Personal data")){
            HStack{
                Image(systemName: "person")
                Text(user.name)
            }
            HStack{
                Image(systemName: "creditcard")
                Text(user.dni)
            }
            HStack{
                Image(systemName: "at")
                Text(user.email)
            }
            HStack{
                Image(systemName: "phone")
                Text(user.phone)
            }
            
        }
        
    }
    
    
    
}
//
//struct UserDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailsView()
//    }
//}
