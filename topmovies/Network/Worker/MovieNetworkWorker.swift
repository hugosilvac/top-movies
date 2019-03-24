//
//  MoviesNetworkWorker.swift
//  topmovies
//
//  Created by HugoSilva on 3/21/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public class MovieNetworkWorker: MovieNetworkContract {
    
    public init () {}
    
    public func popularMovies(page: Int, language: String) -> Observable<InfoRequestNetworkModel> {
        let queryParams = ["language": "\(language)", "page": "\(page)"]
        return RequestManager.shared.fetch(url:MovieRouter.popular.name, parameters: queryParams)
                .mapObject(type: InfoRequestNetworkModel.self)
    }

}
