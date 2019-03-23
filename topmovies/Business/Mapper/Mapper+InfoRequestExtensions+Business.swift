//
//  Mapper+InfoRequestExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

extension InfoRequestNetworkModel {
    func toMovieList() -> [Movie] {
        let result =  self.results
        var movieList = [Movie]()
        movieList.append(contentsOf: result.map({ (element) -> Movie in
            element.toApp()
        }))
        return movieList
    }
}
