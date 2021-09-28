//
//  BubbleCollectionViewCell.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 28/09/21.
//

import UIKit

class BubbleCollectionViewCell: UICollectionViewCell {

    // MARK: Properties
    static let reuseIdentifier: String = "BubbleCollectionViewCell"
    
    // MARK: Outlets
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewBubble: UIImageView!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewBubble.layer.cornerRadius = 35
    }
    
    // MARK: Methods
    func setupUI(urlImage: String) {
        
    }
    
}
