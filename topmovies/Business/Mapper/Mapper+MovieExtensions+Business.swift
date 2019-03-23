//
//  Mapper+MovieExtensions+Business.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

extension MovieNetworkModel {
    func toApp() -> Movie {
        return Movie(voteCount: self.voteCount, id: self.id, video: self.video, voteAverage: self.voteAverage, title: self.title, popularity: self.popularity, posterPath: self.posterPath, originalLanguage: self.originalLanguage, originalTitle: self.originalTitle, genreIds: self.genreIds, backdropPath: self.backdropPath, adult: self.adult, overview: self.overview, releaseDate: self.releaseDate)
    }
}
