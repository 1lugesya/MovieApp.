//
//  HomeMovieView.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 4.03.2023.
//

import SwiftUI

struct HomeMovieView: View {
    
    @State private var selectedView = 0
    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    
                    pickerExtension
                    
                    if selectedView == 1 {
                        
                        TvSeriesView()
                        
                    }
                    else {
                        List {
                            Text("Movies in Theatres")
                                .frame(alignment: .center)
                            
                            moviesInTheatresExtension
                            
                            populerMoviesExtension
                        }
                    }
                }
                .onAppear {
                    movieViewModel.getMovie()
                    movieViewModel.getPlayingMovies()
                    movieViewModel.getPopularTVSeries()
                }
            }
        }
    }
}


struct HomeMovieView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMovieView()
    }
}

extension HomeMovieView {
    
    private var pickerExtension: some View {
        
        Picker("PICKERVIEW", selection: $selectedView) {
            Text("Populer Movies").tag(0)
            Text("TV Series").tag(1)
            
        }
        .pickerStyle(.segmented)
    }
    
    private var moviesInTheatresExtension: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach(movieViewModel.moviePlayingData ?? [PlayingMoviesModelResult]() , id: \.self ) { moviePlaying in
                    
                    NavigationLink(destination: DetailPage(title: moviePlaying.title, voteAverage: moviePlaying.voteAverage, overview: moviePlaying.overview, img: moviePlaying.posterPath)) {
                        PlayingMovieRowView(dataPlaying: moviePlaying)
                        
                    }
                }
            } .frame(height: 250)
        }
    }
    
    private var populerMoviesExtension: some View {
        
        VStack {
            
            Text("Populer Movies")
            
            ForEach(movieViewModel.movieData ?? [MovieModelResult]() , id: \.self ) { movie in
                
                NavigationLink(destination: DetailPage(title: movie.title, voteAverage: movie.voteAverage, overview: movie.overview, img: movie.posterPath)) {
                    MovieRowView(data: movie)
                    
//                        .border(Color.green)
                }
            }
//            .border(Color.purple)
            
        }
        .listStyle(.plain)
    }
}
