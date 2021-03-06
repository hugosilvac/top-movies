//
//  MoviePersistenceContract.swift
//  topmovies
//
//  Created by HugoSilva on 3/24/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift
import RealmSwift

public protocol MoviePersistenceContract {
    func saveMovie(movie: MoviePersistenceModel) -> Bool
    func removeMovie(movie: MoviePersistenceModel) -> Bool
    func favoriteMovies() -> Observable<Results<MoviePersistenceModel>>
    func getMovie(id: Int) -> MoviePersistenceModel?
}
