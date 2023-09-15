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

class APICaller {
    static let shared = APICaller()
    
    func getTrandinMovies(comletion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)

            } catch {
                print(error.localizedDescription )
            }
        }
        task.resume()
    }
}

