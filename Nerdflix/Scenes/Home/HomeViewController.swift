//
//  HomeViewController.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 24/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    private var viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: Outlets
    @IBOutlet weak var collectionViewForYou: UICollectionView!
    @IBOutlet weak var collectionViewAction: UICollectionView!
    @IBOutlet weak var collectionViewDrama: UICollectionView!
    
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
        bindEvents()
        viewModel.getPopularMovies()
        viewModel.getTopMovies()
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
        collectionViewForYou.delegate = self

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 115, height: 200)
        collectionViewForYou.setCollectionViewLayout(layout, animated: true)
        
        collectionViewForYou.register(UINib(nibName: MovieCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
    }

    func bindEvents() {
        viewModel.updateLayout = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionViewForYou.reloadData()
            }
        }
    }
    
    private func showDetails() {
        let controller = MovieDetailsViewController("")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showMovieDetails(_ id: String?) {
        guard let idValue = id else {return}
        let controller = MovieDetailsViewController(idValue)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func handlerButtonSeeDetails(_ sender: Any) {
        showDetails()
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.getMovieAt(indexPath.item)
        let movieId = item.id
        showMovieDetails(movieId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getMoviesQuantity()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = viewModel.getMovieAt(indexPath.item)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell.init(frame: .zero)
        }
        cell.setupModel(item)
        return cell
    }
}
