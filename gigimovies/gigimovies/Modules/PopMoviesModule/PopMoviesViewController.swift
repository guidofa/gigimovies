//
//  PopMoviesViewController.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import UIKit

protocol PopMoviesViewProtocol: UIViewController {
    
}

class PopMoviesViewController: PopMoviesModule.View, PopMoviesViewProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create() -> PopMoviesViewController {
        if let popMoviesController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "PopMoviesViewController")
            as? PopMoviesViewController {
            return popMoviesController
        }
        return PopMoviesViewController()
    }
}
