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
    
    
    //  getTrandinMovies    https://api.themoviedb.org/3/trending/all/day?api_key=c78a618441d0a394e2bf591b2d436875&language=en-US&page=1
    
    func getTrandinMovies(comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(results.results))
            } catch {
                comletion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    //  getTrandingTVs   https://api.themoviedb.org/3/trending/tv/day?api_key=c78a618441d0a394e2bf591b2d436875&language=en-US&page=1
    
    func getTrandingTVs (comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(results.results))
            } catch {
                comletion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    //  getUpcommingMovis   https://api.themoviedb.org/3/movie/upcoming?api_key=c78a618441d0a394e2bf591b2d436875&language=en-US&page=1
    
    func getUpcommingMovies (comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(results.results))
            } catch {
                comletion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    //  getPopular   https://api.themoviedb.org/3/movie/popular?api_key=c78a618441d0a394e2bf591b2d436875&language=en-US&page=1
    
    func getPopular (comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(results.results))
            } catch {
                comletion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    //  getTopRated   https://api.themoviedb.org/3/movie/top_rated?api_key=c78a618441d0a394e2bf591b2d436875&language=en-US&page=1
    
    func getTopRated (comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(results.results))
            } catch {
                comletion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
}
