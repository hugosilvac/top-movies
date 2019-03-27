//
//  MoviesContract.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public protocol MovieBusinessContract {
    func popularMovies(page: Int, language: String) -> Observable<[Movie]>
    func saveMovie(movie: Movie) -> Bool
    func deleteMovie(movie: Movie) -> Bool
    func isFavorite(id: Int) -> Bool
    func favoriteMovies() -> Observable<[Movie]>
}
