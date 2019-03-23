//
//  InfoRequest.swift
//  topmovies
//
//  Created by HugoSilva on 3/22/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import ObjectMapper

public class InfoRequestNetworkModel: Mappable {

    var page: Int = 0
    var totalResults: String = ""
    var totalPages: String = ""
    var results = [MovieNetworkModel]()
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        results <- map["results"]
    }
}
