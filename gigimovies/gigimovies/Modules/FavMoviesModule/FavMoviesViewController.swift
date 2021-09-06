//
//  FavMoviesViewController.swift
//  Gigimovies
//
//  Created by Guido Fabio on 06/09/2021.
//

import UIKit

protocol FavMoviesViewProtocol: UIViewController {
    func getFavMoviesSuccess(favMovies: [MovieEntity])
}

class FavMoviesViewController: FavMoviesModule.View, FavMoviesViewProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    fileprivate var favMovies: [MovieEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getFavMovies()
    }
    
    static func create() -> FavMoviesViewController {
        if let favMoviesController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "FavMoviesViewController")
            as? FavMoviesViewController {
            return favMoviesController
        }
        return FavMoviesViewController()
    }
    
    func getFavMoviesSuccess(favMovies: [MovieEntity]) {
        self.favMovies = favMovies
    }
}

extension FavMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell {
            cell.configure(withMovie: favMovies[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FavoritesManager.shared.removeFromFavorites(at: indexPath.row)
        presenter?.getFavMovies()
    }
}
