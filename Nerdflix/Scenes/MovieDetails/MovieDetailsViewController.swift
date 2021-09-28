//
//  MovieDetailsViewController.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 26/09/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    
    // MARK: Properties
    private var viewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    private var movieId: String = ""
    
    // MARK: Outlets
    @IBOutlet weak var imageReleaseMovie: UIImageView!
    @IBOutlet weak var labelReleaseMovie: UILabel!
    @IBOutlet weak var labelActorsReleaseMovie: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: Initialization
    init(_ id: String) {
        self.movieId = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getMovieDetails(movieId)
        setupUI()
    }
    
    // MARK: Actions
    
    // MARK: Methods
    private func setupUI() {
        title = "Detalhes do filme"
    }
    
    private func setupCollection() {
        collectionView.register(UINib(nibName: BubbleCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: BubbleCollectionViewCell.reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 100)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.dataSource = self
    }

}

extension MovieDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
    
}
