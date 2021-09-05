//
//  PopMoviesPresenter.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import Foundation

protocol PopMoviesPresenterProtocol: BasePresenterProtocol {
    func getPopMovies()
    func getPopMoviesSuccess(movies: [MovieEntity])
}

class PopMoviesPresenter: PopMoviesModule.Presenter, PopMoviesPresenterProtocol {
    func getPopMoviesSuccess(movies: [MovieEntity]) {
        view?.getPopMoviesSuccess(movies: movies)
    }
    
    func getPopMovies() {
        interactor?.getPopMovies()
    }
}
