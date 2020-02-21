//
//  SuggestionRowView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct SuggestionRowView: View {
    
    var city: City
    var airport: Airport
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city.name).font(.headline)
                Text(airport.iataCode)
            }
            
        }
    }
}

//struct SuggestionRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SuggestionRowView()
//    }
//}
