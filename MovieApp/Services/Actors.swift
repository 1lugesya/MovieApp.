//
//  Actors.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 16.04.2023.
//

import Foundation
import Combine

class Actors {
    
    private let session: URLSession
    private let apiKey = "6d8f0870b06bd155c9e28ad81e743d9a"
    static let shared = Actors()
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchActors(completion: @escaping (Result<ActorsModel, ActorError>) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/person/popular?api_key=\(apiKey)&language=en-US&page=1")!
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                completion(.failure(.networkError(NSError(domain: "", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(ActorsModel.self, from: data)
                completion(.success(decoded))
            } catch let error as DecodingError {
                completion(.failure(.jsonParsingError(error)))
            } catch {
                completion(.failure(.unknownError))
            }
        }
        task.resume()
    }
}

enum ActorError: Error {
    case networkError(Error)
    case noDataAvailable
    case jsonParsingError(Error)
    case unknownError
}
