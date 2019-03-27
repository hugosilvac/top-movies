//
//  Mapper+MovieExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RealmSwift

extension Movie {
    func toPercistence(arrayGenre: [Genre] = []) -> MoviePersistenceModel {
        
        let moviePersistence = MoviePersistenceModel(voteCount: self.voteCount, id: self.id, video: self.video, voteAverage: self.voteAverage, title: self.title, popularity: self.popularity, posterPath: self.posterPath, originalLanguage: self.originalLanguage, originalTitle: self.originalTitle, backdropPath: self.backdropPath, adult: self.adult, overview: self.overview, releaseDate: self.releaseDate)
        
        moviePersistence.genre = arrayToList(arrayGender: arrayGenre)
        
        return moviePersistence
    }
    
    func arrayToList(arrayGender: [Genre]) -> List<GenrePersistenceModel> {
        let genderList = List<GenrePersistenceModel>()
        for gender in arrayGender {
            genderList.append(gender.toPersistence())
        }
        return genderList
    }
    
}

extension Collection where Element == MoviePersistenceModel {
    func toMovieList() -> [Movie] {
        var network = [Movie]()
        network.append(contentsOf: self.map({ (element) -> Movie in
            element.toApp(listGender: element.genre)
        }))
        return network
    }
    
}

extension MoviePersistenceModel {
    func toApp(listGender: List<GenrePersistenceModel> = List<GenrePersistenceModel>()) -> Movie {
        let movie = Movie(voteCount: self.voteCount, id: self.id, video: self.video, voteAverage: self.voteAverage, title: self.title, popularity: self.popularity, posterPath: self.posterPath, originalLanguage: self.originalLanguage, originalTitle: self.originalTitle, genreIds: [], backdropPath: self.backdropPath, adult: self.adult, overview: self.overview, releaseDate: self.releaseDate)
        movie.genreObject = listToArray(listGender: listGender)
        return movie
    }
    
    func listToArray(listGender: List<GenrePersistenceModel>) -> [Genre] {
        var arrayGenre = [Genre]()
        for gender in listGender {
            arrayGenre.append(gender.toApp())
        }
        return arrayGenre
    }
}

extension MovieNetworkModel {
    func toApp() -> Movie {
        return Movie(voteCount: self.voteCount, id: self.id, video: self.video, voteAverage: self.voteAverage, title: self.title, popularity: self.popularity, posterPath: self.posterPath, originalLanguage: self.originalLanguage, originalTitle: self.originalTitle, genreIds: self.genreIds, backdropPath: self.backdropPath, adult: self.adult, overview: self.overview, releaseDate: self.releaseDate)
    }
}
