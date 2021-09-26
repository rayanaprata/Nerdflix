//
//  HomeViewController.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 24/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var collectionViewForYou: UICollectionView!
    
    // MARK: Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollections()
    }
    
    // MARK: Actions
    
    // MARK: Methods
    private func setupUI() {
        title = "Nerdflix"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.00)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.backButtonTitle = ""
    }
    
    func setupCollections() {
        collectionViewForYou.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 238)
        collectionViewForYou.setCollectionViewLayout(layout, animated: true)
        
        collectionViewForYou.register(UINib(nibName: MovieCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell.init(frame: .zero)
        }
        return cell
    }
}
