//
//  ActorsModel.swift
//  MovieApp
//
//  Created by Ayşegül Sarı on 16.04.2023.
//

import Foundation

struct ActorsModel: Codable {
    let page: Int?
    let results: [ActorsResult]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ActorsResult: Codable, Hashable {
    let knownFor: [ActorsResultDetail]?
    let name: String?
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case knownFor = "known_for"
        case name = "name"
        case profilePath = "profile_path"
    }
}

struct ActorsResultDetail: Codable, Hashable {
    let name: String?
    let overview, posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case overview = "overview"
        case posterPath = "poster_path"
        case voteAverage  = "vote_average"
        case voteCount  = "vote_count"
        case title = "title"
         
    }
}

