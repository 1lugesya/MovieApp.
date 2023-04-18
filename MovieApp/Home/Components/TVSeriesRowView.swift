//
//  TVSeriesRowView.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 16.04.2023.
//

import SwiftUI

struct TVSeriesRowView: View {
    
    var tvSeriesData: PopularTVSeriesModelResult?

    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some View {
        
        
        VStack {
            
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/" + (tvSeriesData?.posterPath ?? "" ))) { returnedImage in
                returnedImage
                    .resizable()
                    .frame(minWidth: 70, minHeight: 70)
                    .scaledToFill()
//                    .border(Color.green)
                    .font(.caption)
                    .cornerRadius(20)

            } placeholder: {
                ProgressView()
            }

            
            Text(tvSeriesData?.name ?? "")
                .frame(width: 70, height: 70)
                .font(.caption)
                .foregroundColor(Color.blue)
            
            VStack {
                Text("IMDB")
                Text("\(tvSeriesData?.voteAverage ?? 0)" .prefix(3))
                
            }
            .font(.caption)
            .foregroundColor(Color.theme.secondaryText)
            .frame(minWidth: 30)
            .padding()
            
        }
        .onAppear {
            movieViewModel.getPopularTVSeries()
            
        }
    }

}

struct TVSeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            TVSeriesRowView()
                .previewLayout(.sizeThatFits)
            
            PlayingMovieRowView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
        }
    }
}
