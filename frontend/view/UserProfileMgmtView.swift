//
//  UserProfileMgmt.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct UserProfileMgmtView: View {
    
    @EnvironmentObject var userDetails: UserDetails
    @EnvironmentObject var viewsManager: ViewsManager
    @State private var dni = ""
    private var shplUserMgmtProvider = ShplUserMgmtProvider()
    
    var body: some View {
        
        
        NavigationView{
            
            List {
                
                if(!checkIfUserExists()) {
                    
                    Section(header: Text("DNI") ){
                        TextField("DNI", text: $dni)
                    }
                    Section(header: Text("Submit")){
                        Button("Login") {
                            let user = self.shplUserMgmtProvider.getMyProfile(dni: self.dni)
                            self.userDetails.userProfile = user
                            self.viewsManager.selected = 21
                        }
                    }
                    
                } else {
                    UserDetailsView()
                    BookedFlightsView(userId: self.userDetails.userProfile!.dni)
                }
                
            }
            .navigationBarTitle("User profile")
            .listStyle(GroupedListStyle())
            
        }
    }
    
    
    func checkIfUserExists() -> Bool {
        if userDetails.userProfile != nil {
            return true
        }
        //        self.viewsManager.selected = 20
        return false
    }
    
    
    
}

struct UserProfileMgmt_Previews: PreviewProvider {
    static var userDetails = UserDetails()
    static var viewsManager = ViewsManager()
    
    static var previews: some View {
        UserProfileMgmtView().environmentObject(userDetails).environmentObject(viewsManager)
    }
}
