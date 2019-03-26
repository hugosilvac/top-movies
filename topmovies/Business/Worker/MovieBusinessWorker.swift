//
//  MovieBusinesskWorker.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public class MovieBusinesskWorker: MovieBusinessContract {
    
    let movieNetworkWorker: MovieNetworkContract
    let moviePersistenceWorker: MoviePersistenceContract
    
    public init(movieNetworkWorker: MovieNetworkContract = MovieNetworkWorker(), moviePersistenceWorker: MoviePersistenceContract = MoviePersistenceWorker()) {
        self.movieNetworkWorker = movieNetworkWorker
        self.moviePersistenceWorker = moviePersistenceWorker
    }
    
    public func popularMovies(page: Int, language: String) -> Observable<[Movie]> {
        return movieNetworkWorker.popularMovies(page: page, language: language)
            .flatMap({ (element) -> Observable<[Movie]> in
                Observable<[Movie]>.just(element.toMovieList())
            })
    }

    public func saveMovie(movie: Movie) -> Bool {
        return moviePersistenceWorker.saveMovie(movie: movie.toPercistence())
    }

    public func favoriteMovies() -> Observable<[Movie]> {
        return moviePersistenceWorker.favoriteMovies()
            .flatMap({ (element) -> Observable<[Movie]> in
                Observable<[Movie]>.just(element.toMovieList())
            })
    }
}
