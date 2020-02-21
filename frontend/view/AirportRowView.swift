//
//  AirportRowView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct AirportRowView: View {
    
    var airport: Airport
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(airport.name).font(.headline)
                Text(airport.iataCode)
            }
            
            Spacer()
        }
        
    }
}

struct AirportRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        AirportRowView(airport: Airport.example)
    }
}
