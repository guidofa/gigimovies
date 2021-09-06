//
//  FavMoviesViewController.swift
//  Gigimovies
//
//  Created by Guido Fabio on 06/09/2021.
//

import UIKit

protocol FavMoviesViewProtocol: UIViewController {
    
}

class FavMoviesViewController: FavMoviesModule.View, FavMoviesViewProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    static func create() -> FavMoviesViewController {
        if let favMoviesController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "FavMoviesViewController")
            as? FavMoviesViewController {
            return favMoviesController
        }
        return FavMoviesViewController()
    }
}

extension FavMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
