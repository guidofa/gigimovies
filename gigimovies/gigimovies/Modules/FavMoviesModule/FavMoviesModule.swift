//
//  FavMoviesModule.swift
//  Gigimovies
//
//  Created by Guido Fabio on 06/09/2021.
//

import UIKit

class FavMoviesModule: NSObject {
    static func assemble() -> FavMoviesViewProtocol {
        let view = FavMoviesViewController.create()
        let interactor = FavMoviesInteractor()
        let presenter = FavMoviesPresenter()
        presenter.view = view
        presenter.interactor = interactor
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
    
    class View: UIViewController {
        var presenter: FavMoviesPresenterProtocol?
    }
    
    class Interactor: NSObject {
        weak var presenter: FavMoviesPresenterProtocol?
    }
    
    class Presenter: NSObject {
        weak var view: FavMoviesViewProtocol?
        var interactor: FavMoviesInteractorProtocol?
        var navigation: UINavigationController? { return view?.navigationController }
    }
    
    class Router: NSObject {
        weak var presenter: FavMoviesPresenterProtocol?
    }
}
