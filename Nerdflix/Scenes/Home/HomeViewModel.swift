//
//  HomeViewModel.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 26/09/21.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    private var movies: [MovieItemModel] = []
    
    var updateLayout: (() -> Void)?
    var shouldShowErrorMessage: ((String) -> Void)?
    
    func getMoviesQuantity() -> Int {
        return movies.count
    }
    
    func getMovieAt(_ index: Int) -> MovieItemModel {
        return movies[index]
    }
    
    func getPopularMovies() {
        AF.request("https://imdb-api.com/en/API/MostPopularMovies/k_m1r3rgjg", method: .get).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let moviesModel = try JSONDecoder().decode(Moviesmodel.self, from: data)
                self.movies = moviesModel.items ?? []
                self.updateLayout?()
            } catch (let error) {
                self.shouldShowErrorMessage?(error.localizedDescription)
            }
        }
        
    }
    
    func getTopMovies() {
        AF.request("https://imdb-api.com/en/API/MostPopularMovies/k_m1r3rgjg", method: .get).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let moviesModel = try JSONDecoder().decode(Moviesmodel.self, from: data)
                self.movies = moviesModel.items ?? []
                self.updateLayout?()
            } catch (let error) {
                self.shouldShowErrorMessage?(error.localizedDescription)
            }
        }
    }
    
}
