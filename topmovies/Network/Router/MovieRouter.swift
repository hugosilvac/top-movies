//
//  MovieRouter.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

enum MovieRouter: Router {
    case popular
    
    var name: String {
        switch self {
        case .popular: return "/popular"
        }
    }
}
