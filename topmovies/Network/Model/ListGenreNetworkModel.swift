//
//  ListGenderNetworkModel.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import ObjectMapper

public class ListGenreNetworkModel: Mappable {
    
    var listGenre: [GenreNetworkModel] = [GenreNetworkModel]()
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        listGenre <- map["genres"]
    }
}
