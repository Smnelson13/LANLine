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
    let url = URL(string: urlString)
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if let error = error {
            print(error)
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
  
}
