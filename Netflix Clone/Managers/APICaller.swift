//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Dmytro Ivanenko on 15.09.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "c78a618441d0a394e2bf591b2d436875"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrandinMovies(comletion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                comletion(.success(results.results))
            } catch {
                comletion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrandingTVs (comletion: @escaping (Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                comletion(.success(results.results))
            } catch {
                comletion(.failure(error))
            }
        }
        task.resume()
    }
    
}



