//
//  MoviePersistenceModel.swift
//  topmovies
//
//  Created by HugoSilva on 3/24/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RealmSwift

public class MoviePersistenceModel: Object {

    @objc dynamic var voteCount: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var video: Bool = false
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var title: String = ""
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var posterPath: String = ""
    @objc dynamic var originalLanguage: String = ""
    @objc dynamic var originalTitle: String = ""
    @objc dynamic var backdropPath: String = ""
    @objc dynamic var adult: Bool = false
    @objc dynamic var overview: String = ""
    @objc dynamic var releaseDate: String = ""
    var genre = List<GenrePersistenceModel>()
    
    override public class func primaryKey() -> String? {
        return "id"
    }
    
    public convenience init(voteCount: Int, id: Int, video: Bool, voteAverage: Double, title: String, popularity: Double, posterPath: String, originalLanguage: String, originalTitle: String, backdropPath: String, adult: Bool, overview: String, releaseDate: String ) {
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
        self.backdropPath = backdropPath
        self.adult = adult
        self.overview = overview
        self.releaseDate = releaseDate
    }
    
}

