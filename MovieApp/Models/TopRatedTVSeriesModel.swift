//
//  TopRatedTVSeriesModel.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 16.04.2023.
//

import Foundation

struct TopRatedTVSeriesModel: Codable {
    let page: Int?
    let results: [TopRatedTVSeriesModelResult]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct TopRatedTVSeriesModelResult: Codable, Hashable {
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
//    let originCountry: [String]?
//    let originalLanguage: OriginalLanguage?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case voteAverage  = "vote_average"
        case voteCount  = "vote_count"
        
    }
}
