//
//  Mapper+GenderExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

extension GenderNetworkModel {
    func toApp() -> Gender {
        return Gender(id: self.id, name: self.name)
    }
}

extension Collection where Element == GenderNetworkModel {
    func toMovieList() -> [Gender] {
        var network = [Gender]()
        network.append(contentsOf: self.map({ (element) -> Gender in
            element.toApp()
        }))
        return network
    }
}
