//
//  GenderBusinessContract.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//
import RxSwift

public protocol GenreBusinessContract {
    func genreMovies(language: String) -> Observable<[Genre]>
}
