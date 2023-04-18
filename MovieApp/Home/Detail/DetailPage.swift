//
//  DetailPage.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 5.04.2023.
//

import SwiftUI

struct DetailPage: View{
    
    @StateObject private var movieViewModel = MovieViewModel()

    var title: String?
    var voteAverage: Double?
    var overview: String?
    var img: String?
    
    var body: some View {
        
        VStack {
            
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/" + (img ?? "" ))) { returnedImage in
                    returnedImage
                        .resizable()
                        .frame(minWidth: 40, minHeight: 40)
                        .scaledToFit()
                        .font(.caption)
                        .cornerRadius(20)
                    
                } placeholder: {
                    ProgressView()
                }

                Text("\(title ?? "")")
                    .frame(maxHeight: 35)
                    .font(.caption)
                    .foregroundColor(Color.blue)
                
                    Text("IMDB")
                    Text("\(voteAverage ?? 0) ".prefix(9))
            
            Text(overview ?? "nok")
                .foregroundColor(Color.theme.secondaryText)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .padding()
            
            
            ScrollView (.horizontal, showsIndicators: false) {
              
                HStack {
                    
                    ForEach(movieViewModel.actors ?? [ActorsResult]() , id: \.self ) { actors in
                        
                        NavigationLink(destination: ActorDetailView()) {
                            ActorsView(actors: actors)
                            
                        }
                    }
                    
                }
                .onAppear{
                    movieViewModel.getActors()
                }
            }
            
        }
        
    }
}


struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage()
    }
}
