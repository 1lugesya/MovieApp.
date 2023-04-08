//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 4.03.2023.
//

import Foundation


final class MovieViewModel: ObservableObject{
    
    @Published var movieData: [MovieModelResult]?
    
    func getMovie() {
        
        MovieStore.shared.fetchPopulerMovies { MovieResult in
            switch MovieResult {
            case .success(let success):
                self.movieData = success.results
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
    }
     
}
