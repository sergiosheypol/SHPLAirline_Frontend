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
    @EnvironmentObject var viewsManager: ViewsManager
    
    

    
        
    var body: some View {
        
        VStack {
            
            
            NavigationLink(destination: UserDetailsView(), tag: 21, selection: self.$viewsManager.selected) {
                Text("")
            }
            
        }.navigationBarTitle("Login")
        
    }

    
}

//struct LoginFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginFormView()
//    }
//}
