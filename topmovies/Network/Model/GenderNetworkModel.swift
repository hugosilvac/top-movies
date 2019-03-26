//
//  GenderNetworkModel.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import ObjectMapper

public class GenderNetworkModel: Mappable {

    var id: Int = 0
    var name: String = ""
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
       
    }
}
