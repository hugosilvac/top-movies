//
//  Movie.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

public class Movie {

    public var voteCount: Int = 0
    public var id: Int = 0
    public var video: Bool = false
    public var voteAverage: Double = 0.0
    public var title: String = ""
    public var popularity: Double = 0.0
    public var posterPath: String = ""
    public var originalLanguage: String = ""
    public var originalTitle: String = ""
    public var genreIds: [Int] = [Int]()
    public var backdropPath: String = ""
    public var adult: Bool = false
    public var overview: String = ""
    public var releaseDate: String = ""
    
    public convenience init(voteCount: Int, id: Int, video: Bool, voteAverage: Double, title: String, popularity: Double, posterPath: String, originalLanguage: String, originalTitle: String, genreIds: [Int], backdropPath: String, adult: Bool, overview: String, releaseDate: String ) {
        self.init()
        self.voteCount = voteCount
        self.id = id
        self.video = video
        self.voteAverage = voteAverage
        self.title = title
        self.popularity = popularity
        self.posterPath = posterPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreIds = genreIds
        self.backdropPath = backdropPath
        self.adult = adult
        self.overview = overview
        self.releaseDate = releaseDate
    }
    
}
