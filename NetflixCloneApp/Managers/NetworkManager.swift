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

enum APIError: Error {
    case failedToGetData
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: Constants.api) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
