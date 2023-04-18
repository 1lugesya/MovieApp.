//
//  MovieRowView.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 4.03.2023.
//

import SwiftUI

struct MovieRowView: View {
    
    var data: MovieModelResult?
    
    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some View {
        
        HStack {
               
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/" + (data?.posterPath ?? "noimage" )))
            { image in
                image
                    .resizable()
                    .frame(width: 90, height: 100)
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
//                    .border(Color.blue)
                    .font(.caption)
                    .cornerRadius(10)

            } placeholder: {
                ProgressView()
            }

            Text("\(data?.title ?? "")")
                .multilineTextAlignment(.leading)
                .font(.caption)
                .foregroundColor(Color.theme.purple)
            
            Spacer()
            
            VStack {
                Text("IMDB")
                Text("\(data?.voteAverage ?? 0) ".prefix(3))
                
            }
            .font(.caption)
            .foregroundColor(Color.theme.secondaryText)
            .padding(.trailing, 10)
            
        }
        .padding(5)
        .frame(minHeight: 90)
//        .border(Color.red)
        .onAppear {
            movieViewModel.getMovie()
        }
    }
    
}


struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieRowView()
                .previewLayout(.sizeThatFits)
            
            MovieRowView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
        }
    }
}

//extension MovieRowView {
//    
//    private var column: some View {
//        
//        HStack {
//            
//            Spacer()
//            
//            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/" + (data?.posterPath ?? "" )), scale: 30.0)
//                .fixedSize()
//                .scaledToFill()
//                .frame(minWidth: 75, minHeight: 75)
//                .border(Color.blue)
//                .font(.caption)
//            
//                
//            
//            Spacer()
//            Spacer()
//            
//            Text("\(data?.title ?? "")")
//                .font(.caption)
//                .foregroundColor(Color.theme.purple)
//            
//            Spacer()
//            
//            VStack {
//                Text("IMDB")
//                Text("\(data?.voteAverage ?? 0) ".prefix(3))
//                
//            }
//            .font(.caption)
//            .foregroundColor(Color.theme.secondaryText)
//            .padding(.trailing, 10)
//            
//        }
//        .border(Color.red)
//        .onAppear {
//            movieViewModel.getMovie()
//        }
//    }
//}
//

