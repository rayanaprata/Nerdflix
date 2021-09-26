//
//  MovieCollectionViewCell.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 25/09/21.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    // MARK: Properties
    static let reuseIdentifier: String = "MovieCollectionViewCell"
    
    // MARK: Outlets
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: Methods
    private func setupUI() {
        imageMovie.layer.cornerRadius = 10
    }
    
    func setupModel(_ movie: MovieItemModel?) {
        guard let movieModel = movie else {return}
        labelMovieTitle.text = movieModel.fullTitle
        
        guard let urlImage = movie?.image else { return }
        if let url = URL(string: urlImage) {
            imageMovie.kf.setImage(with: url)
        }
    }

}
