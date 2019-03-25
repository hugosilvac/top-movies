//
//  MoviePersistenceContract.swift
//  topmovies
//
//  Created by HugoSilva on 3/24/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RealmSwift

public protocol MoviePersistenceContract {
    func saveMovie(movie: MoviePersistenceModel) -> Bool
    func favoriteMovies() -> Results<MoviePersistenceModel>
}
