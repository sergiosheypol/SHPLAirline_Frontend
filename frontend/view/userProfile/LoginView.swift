//
//  LoginView.swift
//  frontend
//
//  Created by Sergio López on 05/05/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var userDetails: UserDetails
    @State private var dni = ""
    var shplUserMgmtProvider = ShplUserMgmtProvider()
    
    
    var body: some View {
        Section(header: Text("Fill in the form")){
            
            TextField("DNI", text: $dni)
            
            Button("Login") {
                let user = self.shplUserMgmtProvider.getMyProfile(dni: self.dni)
                self.userDetails.userProfile = user
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
