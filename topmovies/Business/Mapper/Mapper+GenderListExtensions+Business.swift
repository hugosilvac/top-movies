//
//  Mapper+GenderListExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//


extension ListGenderNetworkModel {
    func toMovieList() -> [Gender] {
        let list =  self.listGender
        var listGender = [Gender]()
        listGender.append(contentsOf: list.map({ (element) -> Gender in
            element.toApp()
        }))
        return listGender
    }
}
