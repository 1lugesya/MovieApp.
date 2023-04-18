//
//  TvServiesView.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 15.04.2023.
//

import SwiftUI

struct TvSeriesView: View {
    
    @StateObject private var movieViewModel = MovieViewModel()
    
    let columns = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    
//                    pickerExtension
                 
                        List {
                            Text("Popular TV Series")
                                .frame(alignment: .center)
                            
                            popularTVSeriesExtension
                            
                            Text("Top Rated TV Series")

                            topRatedSeriesExtension
                        }
                    
                }
                .onAppear {
                    movieViewModel.getPopularTVSeries()
                    movieViewModel.getTopRatedTVSeries()
                }
            }
        }
    }
        
}

struct TvSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesView()
    }
}

extension TvSeriesView {
    
//    private var pickerExtension: some View {
//
//        Picker("PICKERVIEW", selection: $selectedView) {
//            Text("Populer Movies").tag(0)
//            Text("TV Series").tag(1)
//
//        }
//        .pickerStyle(.segmented)
//    }
    
    
    private var popularTVSeriesExtension: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach(movieViewModel.seriesData ?? [PopularTVSeriesModelResult]() , id: \.self ) { tvSeries in
                    
                    NavigationLink(destination: DetailPage(title: tvSeries.name, voteAverage: tvSeries.voteAverage, overview: tvSeries.overview, img: tvSeries.posterPath)) {
                        TVSeriesRowView(tvSeriesData: tvSeries)
                    }
                }
            } .frame(height: 250)
        }
    }
    
    
    private var topRatedSeriesExtension: some View {
        
        ScrollView {
            
            LazyVGrid(columns: columns, content: {
                
                ForEach(movieViewModel.topRatedData ?? [TopRatedTVSeriesModelResult]() , id: \.self ) { topRatedResult in
                    
                    NavigationLink(destination: DetailPage(title: topRatedResult.name, voteAverage: topRatedResult.voteAverage, overview: topRatedResult.overview, img: topRatedResult.posterPath)) {
                        TopRatedTVSeriesView(topRatedTVData: topRatedResult)
                        
                    }
                }
            })
//            .border(Color.purple)
            .padding(.horizontal)
        }
        .frame(width: 375)
    }
        
}

