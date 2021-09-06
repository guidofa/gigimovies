//
//  FavoritesManager.swift
//  Gigimovies
//
//  Created by Guido Fabio on 06/09/2021.
//

import Foundation

class FavoritesManager {
    private var favArray: [MovieEntity] = []
    // MARK: Singleton
    public class var shared: FavoritesManager {
        struct Static {
            static let instance = FavoritesManager()
        }
        return Static.instance
    }
    
    func getFavs() -> [MovieEntity] {
        return favArray
    }
    
    func addFav(movie: MovieEntity) {
        favArray.append(movie)
    }
    
    func removeFromFavorites(at position: Int) {
        favArray.remove(at: position)
    }
}
