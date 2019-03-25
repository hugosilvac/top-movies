//
//  ConnectionRealm.swift
//  topmovies
//
//  Created by HugoSilva on 3/24/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RealmSwift

class ConnectionRealm {

    static let config = Realm.Configuration(
        schemaVersion: 1,
        migrationBlock: { migration, oldSchemaVersion in
            
    })
    
    static var realm = try! Realm(configuration: config)
    
}
