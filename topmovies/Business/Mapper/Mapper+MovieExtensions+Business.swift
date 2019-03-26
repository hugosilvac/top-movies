//
//  Mapper+MovieExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RealmSwift

extension Movie {
    func toPercistence() -> MoviePersistenceModel {
        return MoviePersistenceModel(voteCount: self.voteCount, id: self.id, video: self.video, voteAverage: self.voteAverage, title: self.title, popularity: self.popularity, posterPath: self.posterPath, originalLanguage: self.originalLanguage, originalTitle: self.originalTitle, genreIds: self.arrayToList(arrayGender: self.genreIds), backdropPath: self.backdropPath, adult: self.adult, overview: self.overview, releaseDate: self.releaseDate)
    }
    
    func arrayToList(arrayGender: [Int]) -> List<Int> {
        let genderList = List<Int>()
        for gender in arrayGender {
            genderList.append(gender)
        }
        return genderList
    }
    
}

extension Collection where Element == MoviePersistenceModel {
    func toMovieList() -> [Movie] {
        var network = [Movie]()
        network.append(contentsOf: self.map({ (element) -> Movie in
            element.toApp()
        }))
        return network
    }
}

extension MoviePersistenceModel {
    func toApp() -> Movie {
        return Movie(voteCount: self.voteCount, id: self.id, video: self.video, voteAverage: self.voteAverage, title: self.title, popularity: self.popularity, posterPath: self.posterPath, originalLanguage: self.originalLanguage, originalTitle: self.originalTitle, genreIds: listToArray(listGender: self.genreIds), backdropPath: self.backdropPath, adult: self.adult, overview: self.overview, releaseDate: self.releaseDate)
    }
    
    func listToArray(listGender: List<Int>) -> [Int] {
        var arrayGender = [Int]()
        for gender in listGender {
            arrayGender.append(gender)
        }
        return arrayGender
    }
    
}

extension MovieNetworkModel {
    func toApp() -> Movie {
        return Movie(voteCount: self.voteCount, id: self.id, video: self.video, voteAverage: self.voteAverage, title: self.title, popularity: self.popularity, posterPath: self.posterPath, originalLanguage: self.originalLanguage, originalTitle: self.originalTitle, genreIds: self.genreIds, backdropPath: self.backdropPath, adult: self.adult, overview: self.overview, releaseDate: self.releaseDate)
    }
}
