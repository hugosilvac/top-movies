//
//  GenderBusinessWorker.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public class GenreBusinessWorker: GenreBusinessContract {
    
    let genreNetworkContract: GenreNetworkContract
    
    public init(genderNetworkContract: GenreNetworkContract = GenreNetworkWorker()) {
        self.genreNetworkContract = genderNetworkContract
    }
    
    public func genreMovies(language: String) -> Observable<[Genre]> {
        return genreNetworkContract.genreMovies(language: language)
            .flatMap({ (element) -> Observable<[Genre]> in
                Observable<[Genre]>.just(element.toMovieList())
            })
    }
    

    
    
}
