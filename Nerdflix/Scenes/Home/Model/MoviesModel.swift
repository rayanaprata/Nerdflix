//
//  MoviesModel.swift
//  Nerdflix
//
//  Created by Rayana Prata Neves on 26/09/21.
//

import Foundation

struct Moviesmodel: Codable {
    let items: [MovieItemModel]?
}

struct MovieItemModel: Codable {
    let fullTitle: String?
    let image: String?
    let id: String?
}
