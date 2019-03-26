//
//  GenderRouter.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

enum GenderRouter: Router {
    case listGender
    
    var name: String {
        switch self {
        case .listGender: return "/genre/movie/list"
        }
    }
}
