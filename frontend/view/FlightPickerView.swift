//
//  AirportsPickerView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct FlightPickerView: View {
    
    @EnvironmentObject var tripDetails: TripDetails
    
    @EnvironmentObject var viewsManager: ViewsManager
    
    @State var showDepartureDatePicker = false
    @State var showReturnDatePicker = false
        
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
                        NavigationLink(destination: AirportSelectionView(viewName: FlightType.RETURN), tag: 2, selection: $viewsManager.selected) {
                            showAirportPicker(airportOpt: tripDetails.arrivalAirport, cityOpt: tripDetails.cityTo)
                        }
                        
                    }
                    
                    
                    Section (header: Text("Departure date")){
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Choose departure date").font(.headline)
                                Divider()
                                DatePicker(selection: $tripDetails.departureDate, displayedComponents: .date) {
                                    Text("")
                                }
                                .labelsHidden()
                            }
                            
                        }.padding(15)
                    }
                    
                    Section(header: Text("Return date")) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Choose return date").font(.headline)
                                Divider()
                                DatePicker(selection: $tripDetails.returnDate, displayedComponents: .date) {
                                    Text("")
                                }
                                .labelsHidden()
                            }
                            
                        }.padding(15)
                    }
                    
                    
                    
                    
                    Section {
                        NavigationLink(
                            destination:DepartureFareListView(),
                            tag: 10,
                            selection: $viewsManager.selected) {
                                Text("Search")
                        }.foregroundColor(Color.green)
                    }
                    
                    
                }
                .navigationBarTitle(Text("Choose your flight"))
                
                
                
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
        formatter.dateFormat = "dd-MM-yyyy"
        
        guard let date = dateOpt else {
            return GenericRowItemView(title: "Choose departure date", subtitle: "Tap on it")
        }
        
        return GenericRowItemView(title: "Date", subtitle: formatter.string(from: date))
    }
    
    
    
    
}

struct AirportsPickerView_Previews: PreviewProvider {
    
    static var selectedAirports = TripDetails()
    static var viewsManager = ViewsManager()
    
    static var previews: some View {
        FlightPickerView().environmentObject(selectedAirports).environmentObject(viewsManager)
    }
}
