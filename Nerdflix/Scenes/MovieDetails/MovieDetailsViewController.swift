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

}
