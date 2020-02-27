//
//  AirportsPickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI
import ModalView

struct FlightPickerView: View {
    
    @EnvironmentObject var tripDetails: TripDetails
    
    @EnvironmentObject var viewsManager: ViewsManager
    
    var body: some View {
        
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Departure airport")) {
                        NavigationLink(destination: AirportSelectionView(viewName: FlightType.DEPARTURE), tag: 1, selection: $viewsManager.selected) {
                            showAirportPicker(airportOpt: tripDetails.departureAirport, cityOpt: tripDetails.cityFrom)
                        }
                    }

                    Section(header: Text("Arrival airport")) {
                        NavigationLink(destination: AirportSelectionView(viewName: FlightType.ARRIVAL), tag: 2, selection: $viewsManager.selected) {
                            showAirportPicker(airportOpt: tripDetails.arrivalAirport, cityOpt: tripDetails.cityTo)
                        }

                    }

                    Section(header: Text("Select departure date")) {
                        NavigationLink(destination: DatePickerView(viewName: FlightType.DEPARTURE), tag: 3, selection: $viewsManager.selected) {
                            showDatePicker(dateOpt: tripDetails.departureDate)
                        }
                    }
                    
                    Section(header: Text("Select arrival date")) {
                        NavigationLink(destination: DatePickerView(viewName: FlightType.ARRIVAL), tag: 4, selection: $viewsManager.selected) {
                            showDatePicker(dateOpt: tripDetails.returnDate)
                        }
                    }
                }
                .navigationBarTitle(Text("Choose your flight"))
                
                
                NavigationLink(destination:FareListView()) {
                    Text("Search")
                }
                .font(.headline)
                .padding(10)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(CGFloat(5))
                
                
            }
        }
        
    }
    
    func showAirportPicker(airportOpt: Airport?, cityOpt: City?) -> GenericRowItemView {
        guard let airport = airportOpt,
        let city = cityOpt else {
            return GenericRowItemView(title: "Choose airport", subtitle: "Tap on it")
        }
        
        return GenericRowItemView(title: city.name, subtitle: airport.iataCode)
    }
    
    func showDatePicker(dateOpt: Date?) -> GenericRowItemView {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateOpt else {
            return GenericRowItemView(title: "Choose departure date", subtitle: "Tap on it")
        }
        
        return GenericRowItemView(title: "Date: ", subtitle: formatter.string(from: date))
    }
    



}

struct AirportsPickerView_Previews: PreviewProvider {
    
    static var selectedAirports = TripDetails()
    static var viewsManager = ViewsManager()
    
    static var previews: some View {
        FlightPickerView().environmentObject(selectedAirports).environmentObject(viewsManager)
    }
}
