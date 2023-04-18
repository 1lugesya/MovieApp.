//
//  ActorDetailView.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 18.04.2023.
//

import SwiftUI

struct ActorDetailView: View {
    var body: some View {
        
        VStack {
            
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/" + ( "" ))) { returnedImage in
                    returnedImage
                        .resizable()
                        .frame(minWidth: 40, minHeight: 40)
                        .scaledToFit()
                        .font(.caption)
                        .cornerRadius(20)
                    
                } placeholder: {
                    ProgressView()
                }

                Text("\( "")")
                    .frame(maxHeight: 35)
                    .font(.caption)
                    .foregroundColor(Color.blue)
                
                    Text("IMDB")
                    Text("\("") ".prefix(9))
            
            Text( "nok")
                .foregroundColor(Color.theme.secondaryText)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .padding()
                     
        }
        
    }
}

struct ActorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActorDetailView()
    }
}
