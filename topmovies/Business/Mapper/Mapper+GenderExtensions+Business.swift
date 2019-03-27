//
//  Mapper+GenderExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RealmSwift

extension GenrePersistenceModel {
    func toApp() -> Genre {
        return Genre(id: self.id, name: self.title)
    }
}

extension Genre {
    func toPersistence() -> GenrePersistenceModel {
        return GenrePersistenceModel(id: self.id, title: self.name)
    }
}

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

