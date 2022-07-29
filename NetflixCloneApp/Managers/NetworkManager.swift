//
//  NetworkManager.swift
//  NetflixCloneApp
//
//  Created by Nikolai Maksimov on 29.07.2022.
//

import Foundation

struct Constants {
//    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
//    static let baseURL = "https://api.themoviebd.org"
    
   static let api = "https://api.themoviedb.org/3/trending/all/day?api_key=697d439ac993538da4e3e60b54e762cd"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        
        guard let url = URL(string: Constants.api) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)

            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
