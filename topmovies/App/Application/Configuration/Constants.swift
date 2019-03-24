//
//  Constants.swift
//  topmovies
//
//  Created by HugoSilva on 3/23/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

struct Constants {

    struct Config {
        // Image Url
        static let ImageURL = "http://image.tmdb.org/t/p/"
    }
    
    struct Cell {
        static let ReuseIdentifierMovieCollectionCell        = "MovieCollectionViewCell"
    }
    
    struct RequestMovieParameters {
        static let Language  =  "en-US"
        static let Page         =  1
        static let Size         =  1
    }
    
}
