//
//  GenderBusinessWorker.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public class GenderBusinessWorker: GenderBusinessContract {
    
    let genderNetworkContract: GenderNetworkContract
    
    public init(genderNetworkContract: GenderNetworkContract = GenderNetworkWorker()) {
        self.genderNetworkContract = genderNetworkContract
    }
    
    public func genderMovies(language: String) -> Observable<[Gender]> {
        return genderNetworkContract.genderMovies(language: language)
            .flatMap({ (element) -> Observable<[Gender]> in
                Observable<[Gender]>.just(element.toMovieList())
            })
    }
    

    
    
}
