//
//  RequestManager+Observable.swift
//  topmovies
//
//  Created by HugoSilva on 3/21/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift
import RxAlamofire

typealias RequestManager_Observable = RequestManager
extension RequestManager_Observable {
    
    func observable(url: String, method: Method = .GET ,parameters: [String: Any] = [:], headers: [String: String] = [:], encoding: UrlEncoding = .json) -> Observable<(HTTPURLResponse, Any)> {
        return Request.fromPathURL(url).method(method)
            .encodParameters(encoding).header(headers)
            .queryParameters(parameters).request()
    }
    
}

