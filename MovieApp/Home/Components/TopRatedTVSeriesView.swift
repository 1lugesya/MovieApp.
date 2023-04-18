//
//  TopRatedTVSeriesView.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 16.04.2023.
//

import SwiftUI

struct TopRatedTVSeriesView: View {
    
    var topRatedTVData: TopRatedTVSeriesModelResult?

    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some View {
        
        topRatedRowView
        
        .onAppear {
            movieViewModel.getTopRatedTVSeries()
            
        }
        
    }
}

struct TopRatedTVSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopRatedTVSeriesView()
                .previewLayout(.sizeThatFits)
            
            TopRatedTVSeriesView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
        }
    }
}

extension TopRatedTVSeriesView {
    
    private var topRatedRowView: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/" + (topRatedTVData?.posterPath ?? "" ))) { returnedImage in
                returnedImage
                    .resizable()
                    .frame(minWidth: 40, minHeight: 40)
                    .scaledToFit()
//                    .border(Color.green)
                    .font(.caption)
                    .cornerRadius(20)
                
            } placeholder: {
                ProgressView()
            }

            
            Text("\(topRatedTVData?.name ?? "")")
                .frame(maxHeight: 35)
                .font(.caption)
                .foregroundColor(Color.blue)
            
            VStack {
                Text("IMDB")
                Text("\(topRatedTVData?.voteCount ?? 0) ".prefix(3))
                
            }
            .font(.caption)
            .foregroundColor(Color.theme.secondaryText)
            .padding()
        }
    }
    
}
