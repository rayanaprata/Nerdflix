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
    }
    
    // MARK: Actions
    
    // MARK: Methods
    private func setupUI() {
        
    }
    


}
