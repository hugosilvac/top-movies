//
//  MovieBusinesskWorker.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public class MovieBusinesskWorker: MovieBusinessContract {
    
    let movieWorker: MovieNetworkContract
    
    public init(movieWorker: MovieNetworkContract = MovieNetworkWorker()) {
        self.movieWorker = movieWorker
    }
    
    public func popularMovies(page: Int, language: String) -> Observable<[Movie]> {
        return movieWorker.popularMovies(page: page, language: language)
            .flatMap({ (element) -> Observable<[Movie]> in
                Observable<[Movie]>.just(element.toMovieList())
            })
    }

}
