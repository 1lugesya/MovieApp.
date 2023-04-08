//
//  HomeMovieView.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 4.03.2023.
//

import SwiftUI

struct HomeMovieView: View {
    
    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some View {
        
        NavigationView {
            
                
                ZStack{
                    Color.theme.background
                        .ignoresSafeArea()
                    
                    VStack {
                        
                            Text("POPULER MOVIES")
                        
                        
                        List {
                            
                            ForEach(movieViewModel.movieData ?? [MovieModelResult]() , id: \.self ) { movie in
                                
                                NavigationLink(destination: DetailPage(title: movie.title)) {
                                    MovieRowView(data: movie)
                                }
                            }
                            
                        }
                        .listStyle(.inset)
                        
                    }
                       
                }
                
            
            .onAppear {
                movieViewModel.getMovie()
            }
            
        }
    }
    
    
}


struct HomeMovieView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMovieView()
    }
    
}


extension Double {
    private var numberFormatter: NumberFormatter {

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter

    }
    ///Converts a Double into a number  as a String with 2 decimal places
    ///```
    ///Convert 1234.56 to "$1,234.5"
    ///```

    func asNumberWithDecimals() -> String {
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? "0"


    }

}
