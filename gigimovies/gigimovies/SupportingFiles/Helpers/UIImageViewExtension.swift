//
//  UIImageViewExtension.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import Kingfisher
import UIKit

extension UIImageView {
    func setmage(url: URL) {
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: 0)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "video_placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage]) { result in
                    switch result {
                    case .success(let value):
                        print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
