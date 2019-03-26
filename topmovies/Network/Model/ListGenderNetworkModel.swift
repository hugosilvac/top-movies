//
//  ListGenderNetworkModel.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import ObjectMapper

public class ListGenderNetworkModel: Mappable {
    
    var listGender: [GenderNetworkModel] = [GenderNetworkModel]()
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        listGender <- map["genres"]
    }
}
