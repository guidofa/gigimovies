//
//  MovieEntity.swift
//  Gigimovies
//
//  Created by Guido Fabio on 02/09/2021.
//

import Foundation

struct MovieEntity: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

struct Results: Codable {
    let page: Int
    let results: [MovieEntity]
}
