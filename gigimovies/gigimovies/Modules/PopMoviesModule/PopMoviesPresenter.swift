//
//  PopMoviesPresenter.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import Foundation

protocol PopMoviesPresenterProtocol: BasePresenterProtocol {
    func getPopMovies()
}

class PopMoviesPresenter: PopMoviesModule.Presenter, PopMoviesPresenterProtocol {
    func getPopMovies() {
        interactor?.getPopMovies()
    }
}
