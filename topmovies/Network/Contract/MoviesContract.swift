//
//  MoviesContract.swift
//  topmovies
//
//  Created by HugoSilva on 3/21/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public protocol MoviesNetworkContract {
    func popularMovies(page: Int, language: String) -> Observable<Void>
}
