//
//  ShplUserMgmtProvider.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 20/03/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation


class ShplUserMgmtProvider: ObservableObject {
    
    private let endpointsProvider = EndpointsProvider()
    
    
    func getMyProfile(dni: String) -> User? {
        let semaphore = DispatchSemaphore (value: 0)
        
        let parameters = "{\"query\":\"query getUser{\\n  getUSERMGMT(dni:\\\"\(dni)\\\") {\\n    dni\\n    name\\n    email\\n    phone\\n    gender\\n    age\\n  }\\n}\",\"variables\":{}}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: endpointsProvider.users!)!,timeoutInterval: Double.infinity)
        request.addValue(endpointsProvider.apiKey!, forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        var user: User?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            let userMap: Data = try! JSONDecoder().decode(Data.self, from: data)
            
            user = userMap.data["getUSERMGMT"]
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return user
    }
}
