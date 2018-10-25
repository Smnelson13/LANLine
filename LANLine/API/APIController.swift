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
    
    func fetchTopLevelData(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue("4774f5e64252a0b18f62a488293ab738", forHTTPHeaderField: "user-key")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(responseObject)
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
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
    
    
    func gameid(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue("4774f5e64252a0b18f62a488293ab738", forHTTPHeaderField: "user-key")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                if let array = self.parseJSON(data) {
                    print(array)
                }
            }
        }.resume()
    }
    
    func parseJSON(_ data: Data) -> [[String: Any]]?
    {
        do
        {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let array = json as? [[String: Any]]
            {
                print(array)
                return array
            }
            else
            {
                return nil
            }
        }
        catch
        {
            print(error)
            return nil
        }
    }

}
        
        
//            if let error = error {
//                print( "DataTask Error: " + error.localizedDescription + "\n")
//            } else if let data = data {
//                if let httpResponse = response as? HTTPURLResponse
//                {
//                    if httpResponse.statusCode == 200 // Ok
//                    {
//                        if let array = self.parseJSON(data)
//                        {
//                            var pulse = [Pulse]()
//                            for pulseDictionary in array
//                            {
//                                let aPulse = Pulse(pulseDictionary: pulseDictionary)
//                                pulse.append(aPulse)
//                            }
//
//                            self.pulseDelegate?.didRecievePulseInfo(results: pulse)
//                        }
//                    }
//                    else if httpResponse.statusCode == 429 // Rate limit reached
//                    {
//                        print("Rate Limit Reached")
//                    }
//                }
//
//            } else {
//
//                print("requestError")
//            }

