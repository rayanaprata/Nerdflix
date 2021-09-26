//
//  MovieCollectionViewCell.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 25/09/21.
//

import UIKit

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
    func setupUI() {
        imageMovie.layer.cornerRadius = 5
    }

}
