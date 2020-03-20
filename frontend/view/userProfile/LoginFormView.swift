//
//  LoginFormView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct LoginFormView: View {
    
    @EnvironmentObject var userDetails: UserDetails
    
    private var shplUserMgmtProvider = ShplUserMgmtProvider()
    
    @State private var dni = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("DNI") ){
                    TextField("DNI", text: $dni)
                }
                Section(header: Text("Submit")){
                    Button("Login") {
                        
                        let user = self.shplUserMgmtProvider.getMyProfile(dni: self.dni)
                        print(user)
                        self.userDetails.userProfile = user
                    }
                }
            }
        }.navigationBarTitle("Login")
        
    }
}

//struct LoginFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginFormView()
//    }
//}
