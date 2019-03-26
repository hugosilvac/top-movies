//
//  GenderNetworkWorker.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

public class GenderNetworkWorker: GenderNetworkContract {

    public init () {}
    
    public func genderMovies(language: String) -> Observable<ListGenderNetworkModel> {
        let queryParams = ["language": "\(language)"]
        return RequestManager.shared.fetch(url: GenderRouter.listGender.name, parameters: queryParams)
            .mapObject(type: ListGenderNetworkModel.self)
    }
    
    
}
