//
//  GenrePersistenceModel.swift
//  topmovies
//
//  Created by HugoSilva on 3/26/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RealmSwift

class GenrePersistenceModel: Object {

    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    
    override public class func primaryKey() -> String? {
        return "id"
    }
    
    public convenience init(id: Int, title: String ) {
        self.init()
        self.id = id
        self.title = title
    }
    
}
