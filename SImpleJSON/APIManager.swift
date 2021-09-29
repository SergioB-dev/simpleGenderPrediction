//
//  APIManager.swift
//  SImpleJSON
//
//  Created by Sergio Bost on 9/29/21.
//

import Foundation

struct APIManager {
    private let baseURLString = "https://api.genderize.io/"
    
    
    func fetchResults(with name: String, completion: @escaping (GenderProb) -> Void) {
        var url = URLComponents(string: baseURLString)!
        let query = URLQueryItem(name: "name", value: name)
        url.queryItems = [query]
        
        let urlRequest = URLRequest(url: url.url!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil { return }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                let genderProb = try decoder.decode(GenderProb.self, from: data)
                completion(genderProb)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
