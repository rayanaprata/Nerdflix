//
//  MovieDetailsViewModel.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 26/09/21.
//

import Foundation
import Alamofire

class MovieDetailsViewModel {
    
    func getMovieDetails(_ id: String) {
        AF.request("https://imdb-api.com/en/API/FullCast/k_m1r3rgjg/\(id)", method: .get).responseJSON { (response) in
            
        }
        
    }
    
}
