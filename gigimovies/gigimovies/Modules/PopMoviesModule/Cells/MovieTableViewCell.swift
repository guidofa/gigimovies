//
//  MovieTableViewCell.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet fileprivate weak var movieImageView: UIImageView!
    @IBOutlet fileprivate weak var movieTitle: UILabel!
    
    func configure(withMovie movie: MovieEntity) {
        movieTitle.text = movie.title
        guard let posterPath = movie.poster_path else { return }
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) else { return }
        movieImageView.setmage(url: url)
    }
}
