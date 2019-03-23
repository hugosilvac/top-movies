//
//  Movie.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import ObjectMapper

public class MovieNetworkModel: Mappable {
    
    var voteCount: Int = 0
    var id: Int = 0
    var video: Bool = false
    var voteAverage: Double = 0.0
    var title: String = ""
    var popularity: Double = 0.0
    var posterPath: String = ""
    var originalLanguage: String = ""
    var originalTitle: String = ""
    var genreIds: [Int] = [Int]()
    var backdropPath: String = ""
    var adult: Bool = false
    var overview: String = ""
    var releaseDate: String = ""
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        voteCount <- map["page"]
        id <- map["total_results"]
        video <- map["total_pages"]
        voteAverage <- map["results"]
        title <- map["page"]
        popularity <- map["total_results"]
        posterPath <- map["total_pages"]
        originalLanguage <- map["results"]
        originalTitle <- map["page"]
        genreIds <- map["total_results"]
        backdropPath <- map["total_pages"]
        adult <- map["results"]
        overview <- map["page"]
        releaseDate <- map["total_results"]

    }
}
