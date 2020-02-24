//
//  ShplCustomProvider.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 23/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

struct JsonQueryRequest: Encodable {
    var query: String
}

class ShplCustomProvider: ObservableObject {
    private let endpoint = URL(string: "http://localhost/graphql")
    
    
    
    func getAutocomplete(phrase: String) {
        
        
    }
    
    func generateAutocompleteQuery(phrase: String) -> String {
        
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .withoutEscapingSlashes
        
        let query =
        """
        {
            autocomplete(phrase:"Sta") {
                code
                city {
                    code
                    name
                }
                country{
                    code
                    name
                }
            }
        }
        """
                
        do {
            let body = try encoder.encode(JsonQueryRequest(query: query))
            
            
            print(String(data: body, encoding: .utf8))
            
            

            var req = URLRequest(url: self.endpoint!)
            req.httpBody = body
            req.httpMethod = "POST"
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            
            URLSession.shared.dataTask(with: req) { data, response, error in
                if let data = data {
                    print(data)
                }
                
            }.resume()
            
        } catch let error as NSError {
            print(error)
        }
        
        
        
        
        var req = URLRequest(url: self.endpoint!)
        req.httpBody = query.data(using: .utf8)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: req) { data, response, error in
            if let data = data {
                print(data)
                print(response)
                
            }
            
        }.resume()
        
        return ""
    }
    


}
