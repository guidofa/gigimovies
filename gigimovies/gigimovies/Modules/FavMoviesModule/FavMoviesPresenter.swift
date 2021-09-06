//
//  FavMoviesPresenter.swift
//  Gigimovies
//
//  Created by Guido Fabio on 06/09/2021.
//

import Foundation

protocol FavMoviesPresenterProtocol: BasePresenterProtocol {
    func getFavMovies()
}

class FavMoviesPresenter: FavMoviesModule.Presenter, FavMoviesPresenterProtocol {
    func getFavMovies() {
        view?.getFavMoviesSuccess(favMovies: FavoritesManager.shared.getFavs())
    }
}
