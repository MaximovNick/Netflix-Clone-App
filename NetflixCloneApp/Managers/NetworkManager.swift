//
//  NetworkManager.swift
//  NetflixCloneApp
//
//  Created by Nikolai Maksimov on 29.07.2022.
//

import Foundation

struct Constants {
    
    static let trendingMovie = "https://api.themoviedb.org/3/trending/movie/day?api_key=697d439ac993538da4e3e60b54e762cd"
    static let trendingTv = "https://api.themoviedb.org/3/trending/tv/day?api_key=697d439ac993538da4e3e60b54e762cd"
    
    static let upcomingMovie = "https://api.themoviedb.org/3/movie/upcoming?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US&page=1"
    static let popularMovie = "https://api.themoviedb.org/3/movie/popular?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US&page=1"
    static let ratedMovie = "https://api.themoviedb.org/3/movie/top_rated?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US&page=1"
}

enum APIError: Error {
    case failedToGetData
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: Constants.trendingMovie) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.trendingTv) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.upcomingMovie) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.popularMovie) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.ratedMovie) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
