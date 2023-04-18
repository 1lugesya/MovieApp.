//
//  ActorsView.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 17.04.2023.
//

import SwiftUI

struct ActorsView: View {
    
    var actors: ActorsResult?
    
    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/" + (movieViewModel.actors?[1].profilePath ?? "a" ))) { returnedImage in
                returnedImage
                    .resizable()
                    .frame(minWidth: 30, minHeight: 30)
                    .scaledToFit()
                //                    .border(Color.green)
                    .font(.caption)
                    .cornerRadius(20)
                
            } placeholder: {
                ProgressView()
            }
            
            
            Text(movieViewModel.actors?[1].name ?? "a")

                .frame(maxHeight: 35)
                .font(.caption)
                .foregroundColor(Color.blue)
            
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .padding()
        }
        
        .onAppear{
            movieViewModel.getActors()
        }
        
    }
}

struct ActorsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ActorsView()
                .previewLayout(.sizeThatFits)
            
            ActorsView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
