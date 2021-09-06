//
//  PopMoviesViewController.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import UIKit

protocol PopMoviesViewProtocol: UIViewController {
    func getPopMoviesSuccess(movies: [MovieEntity])
    func searchSuccess(movies: [MovieEntity])
}

class PopMoviesViewController: PopMoviesModule.View, PopMoviesViewProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var searchBar: UISearchBar!
    fileprivate var moviesToShow: [MovieEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getPopMovies()
    }
    
    static func create() -> PopMoviesViewController {
        if let popMoviesController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "PopMoviesViewController")
            as? PopMoviesViewController {
            return popMoviesController
        }
        return PopMoviesViewController()
    }
    
    func getPopMoviesSuccess(movies: [MovieEntity]) {
        moviesToShow = movies
    }
}

extension PopMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell {
            cell.configure(withMovie: moviesToShow[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension PopMoviesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let stringToFilter = searchBar.text, !stringToFilter.isEmpty {
            presenter?.searchButtonClicked(query: stringToFilter)
        }
        searchBar.resignFirstResponder()
    }
    
    func searchSuccess(movies: [MovieEntity]) {
        moviesToShow = movies
    }
}
