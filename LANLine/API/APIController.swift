//
//  APIController.swift
//  LANLine
//
//  Created by Shane Nelson on 10/7/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import Foundation

class APIController {
  
    static var shared = APIController()

    func fetchGenericData<T: Codable>(urlString: String, completion: @escaping (T) -> ()) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue("4774f5e64252a0b18f62a488293ab738", forHTTPHeaderField: "user-key")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data \(error)")
                return
            }
            guard let data = data else { return }
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                completion(responseObject)
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    
    func getTopLevelCollection(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue("4774f5e64252a0b18f62a488293ab738", forHTTPHeaderField: "user-key")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let results = json as? [[String: Any]] {
                        print(results)
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

}
        
        
