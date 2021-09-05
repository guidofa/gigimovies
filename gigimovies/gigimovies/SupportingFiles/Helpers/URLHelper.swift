//
//  URLHelper.swift
//  Gigimovies
//
//  Created by Guido Fabio on 05/09/2021.
//

import Foundation

class URLHelper: NSObject {
    private static let baseURL = "https://api.themoviedb.org/3"
    private static let apiKey = "?api_key=ef22fd117d94f612763fe8531e33f256"
    private static let languageURL = "&language=es"

    // https://api.themoviedb.org/3/search/movie?api_key=<<api_key>>&language=en-US&query=James&page=1&include_adult=false
    
    class func getQueryURL(query: String) -> String {
        return "&query=\(query)"
    }
    
    class func getSearchUrl(query: String) -> String {
        let searchURL = "/search/movie"
        return baseURL+searchURL+apiKey+languageURL+getQueryURL(query: query)
    }
    
    class func getPopMoviesURL() -> String {
        let popularMovieURL = "/movie/popular"
        return baseURL+popularMovieURL+apiKey+languageURL
    }
}
