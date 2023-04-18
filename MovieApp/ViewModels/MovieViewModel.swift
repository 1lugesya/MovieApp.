//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 4.03.2023.
//

import Foundation


final class MovieViewModel: ObservableObject{
    
    @Published var moviePlayingData: [PlayingMoviesModelResult]?
    @Published var movieData: [MovieModelResult]?
    @Published var seriesData: [PopularTVSeriesModelResult]?
    @Published var topRatedData: [TopRatedTVSeriesModelResult]?
    @Published var actors: [ActorsResult]?


    
    
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
    
     
    func getPlayingMovies() {
        
        PlayingMovies.shared.fetchPlayingMovies { playingMovieResult in
            switch playingMovieResult {
            case .success(let successResult) :
                print(successResult.results ?? 0)
                self.moviePlayingData = successResult.results
            case .failure(let failurePlayingMovies) :
                print(failurePlayingMovies.localizedDescription)
            }
        }
        
    }
    
    func getPopularTVSeries() {
        
        PopularTVSeries.shared.fetchPopularTVSeries { seriesResult in
            switch seriesResult {
            case .success(let successSeriesResult) :
                print(successSeriesResult.results ?? 0)
                self.seriesData = successSeriesResult.results
            case .failure(let failureSeries) :
                print(failureSeries.localizedDescription)
            }
        }
        
    }
    
    func getTopRatedTVSeries() {
        
        TopRatedTVSeries.shared.fetchTopRatedTVSeries { topRatedResult in
            switch topRatedResult {
            case .success(let successTopRatedResult) :
                print(successTopRatedResult.results ?? 0)
                self.topRatedData = successTopRatedResult.results
            case .failure(let failureTopRated) :
                print(failureTopRated.localizedDescription)
            }
        }
        
    }
    
    func getActors() {
        
        Actors.shared.fetchActors { actorsResult in
            switch actorsResult {
            case .success(let successActorsResult) :
                print(successActorsResult.results ?? 0)
                self.actors = successActorsResult.results
            case .failure(let failureActors) :
                print(failureActors.localizedDescription)
            }
        }
        
    }
    
    
}
