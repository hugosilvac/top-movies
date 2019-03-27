//
//  GenderRouter.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

enum GenreRouter: Router {
    case listGenre
    
    var name: String {
        switch self {
        case .listGenre: return "/genre/movie/list"
        }
    }
}
