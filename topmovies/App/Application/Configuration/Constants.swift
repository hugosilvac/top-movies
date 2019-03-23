//
//  Constants.swift
//  topmovies
//
//  Created by HugoSilva on 3/23/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

struct Constants {

    struct Config {
        // Base Url
        static let BaseURL = "https://api.themoviedb.org/3/movie"
    }
    
    struct Cell {
        static let ReuseIdentifierMovieCollectionCell        = "MovieCollectionViewCell"
    }
    
    struct RequestMovieParameters {
        static let Language  =  "en-US"
        static let Page         =  1
        static let Size         =  20
    }
    
}
