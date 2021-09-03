//
//  PopMoviesModule.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import UIKit

class PopMoviesModule: NSObject {
    static func assemble() -> PopMoviesViewProtocol {
        let view = PopMoviesViewController.create()
        let interactor = PopMoviesInteractor()
        let presenter = PopMoviesPresenter()
        let router = PopMoviesRouter()
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        return view
    }
    
    class View: UIViewController {
        var presenter: PopMoviesPresenterProtocol?
    }
    
    class Interactor: NSObject {
        weak var presenter: PopMoviesPresenterProtocol?
    }
    
    class Presenter: NSObject {
        weak var view: PopMoviesViewProtocol?
        var interactor: PopMoviesInteractorProtocol?
        var router: PopMoviesRouterProtocol?
        var navigation: UINavigationController? { return view?.navigationController }
    }
    
    class Router: NSObject {
        weak var presenter: PopMoviesPresenterProtocol?
    }
}
