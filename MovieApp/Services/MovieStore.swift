//
//  MovieStore.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 4.03.2023.
//

import Foundation
import Combine

class MovieStore {
    
    private let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    static let shared = MovieStore()
    
    func fetchPopulerMovies(completion: @escaping (Result<MovieModel, Error>) -> Void) {

        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=6d8f0870b06bd155c9e28ad81e743d9a&language=en-US&page=1")!
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            
         
            if let data = data {
                
                do {
                    let decoded = try JSONDecoder().decode(MovieModel.self, from: data)
                    completion(.success(decoded))
                    
                }
                catch {
                    print(String(describing: error))
                }
            }
            
        }
        
        task.resume()
    }
}
