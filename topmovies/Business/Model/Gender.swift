//
//  Gender.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

public class Gender {

    var id: Int = 0
    var name: String = ""
    
    public convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
}
