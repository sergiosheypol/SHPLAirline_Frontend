




let parameters = "{\"query\":\"query getUser{\\n  getUSERMGMT(dni:\\\"01078984P\\\") {\\n    dni\\n    name\\n    email\\n    bookings\\n    registryDate\\n  }\\n}\",\"variables\":{}}"
let postData = parameters.data(using: .utf8)

var request = URLRequest(url: URL(string: endpointsProvider.users!)!,timeoutInterval: Double.infinity)
request.addValue(endpointsProvider.apiKey!, forHTTPHeaderField: "x-api-key")
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
