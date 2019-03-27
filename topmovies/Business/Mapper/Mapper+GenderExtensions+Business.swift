//
//  Mapper+GenderExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

extension GenreNetworkModel {
    func toApp() -> Genre {
        return Genre(id: self.id, name: self.name)
    }
}

extension Collection where Element == GenreNetworkModel {
    func toMovieList() -> [Genre] {
        var network = [Genre]()
        network.append(contentsOf: self.map({ (element) -> Genre in
            element.toApp()
        }))
        return network
    }
}
