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
    

    var body: some View {
        NavigationView{
            List {
                if(!checkIfUserExists()) {
                    LoginView()
                } else {
                    UserDetailsView(user: userDetails.userProfile!)
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
