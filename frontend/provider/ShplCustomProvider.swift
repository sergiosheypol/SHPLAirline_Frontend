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
    
    
    
    
    
    @Published private var autocompletedAirports: [Autocomplete] = [Autocomplete]()

    
    func getSuggestions() -> [Autocomplete] {
        return self.autocompletedAirports
    }
    
    
    func getAutocomplete(phrase: String) {
        
        
    }
    
    func generateAutocompleteQuery(phrase: String) -> String {
        
        
        let parameters = "{\"query\":\"{\\n    autocomplete(phrase:\\\"Sta\\\") {\\n        code\\n        city {\\n            code\\n            name\\n        }\\n        country{\\n            code\\n            name\\n        }\\n    }\\n}\",\"variables\":{}}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://localhost/graphql")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

        
        return ""
    }
    


}
