//
//  FareRowDetailView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 25/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct FareRowDetailView: View {
    
    var fare : Fare
    var cityFrom: City
    var cityTo: City
    
    var body: some View {
        
        HStack() {
            VStack(spacing: 15) {
                Text("\(cityFrom.name)").font(.headline)
                Divider()
                formatDate(date: fare.departureDate)
                
            }
            Spacer()
            VStack {
                Image(systemName: "airplane")
                Text("\(fare.flightNumber)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(spacing:15) {
                Text("\(cityTo.name)").font(.headline)
                Divider()
                formatDate(date: fare.arrivalDate)
            }
            
        }.padding(20)
        
    }
    
    func formatDate(date: Date) -> Text {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        
        return Text("\(formatter.string(from: date))").foregroundColor(.green)
        
    }
}

struct FareRowDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        FareRowDetailView(fare: Fare.fareExample, cityFrom: City.exampleCity, cityTo: City.exampleCity)
    }
}
