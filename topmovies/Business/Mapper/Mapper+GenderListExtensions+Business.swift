//
//  Mapper+GenderListExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//


extension ListGenreNetworkModel {
    func toMovieList() -> [Genre] {
        let list =  self.listGenre
        var listGender = [Genre]()
        listGender.append(contentsOf: list.map({ (element) -> Genre in
            element.toApp()
        }))
        return listGender
    }
}
