//
//  GenderNetworkWorker.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public class GenreNetworkWorker: GenreNetworkContract {

    public init () {}
    
    public func genreMovies(language: String) -> Observable<ListGenreNetworkModel> {
        let queryParams = ["language": "\(language)"]
        return RequestManager.shared.fetch(url: GenreRouter.listGenre.name, parameters: queryParams)
            .mapObject(type: ListGenreNetworkModel.self)
    }
    
    
}
