//
//  RequestCertificate.swift
//  topmovies
//
//  Created by HugoSilva on 3/21/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import Alamofire

typealias RequestCertificate = Request
extension RequestCertificate {
    
    public static let sharedManager: Alamofire.SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 60.0        
        return Alamofire.SessionManager(configuration: configuration)
        
    }()
    
}

