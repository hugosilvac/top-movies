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
    func saveMovie(movie: Movie, arrayGenre: [Genre]) -> Bool
    func deleteMovie(movie: Movie) -> Bool
    func favoriteMovies() -> Observable<[Movie]>
    func getMovie(id: Int) -> Movie?
}
