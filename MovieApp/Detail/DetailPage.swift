//
//  DetailPage.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 5.04.2023.
//

import SwiftUI

struct DetailPage: View{
    var title: String?
    var imdb: Int?
    
    var body: some View {
        Text(title ?? "")
        
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage()
    }
}
