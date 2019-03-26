//
//  Request.swift
//  topmovies
//
//  Created by HugoSilva on 3/21/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift
import Alamofire

enum Method: String {
    case GET, POST, PUT, PATCH, DELETE
}

enum UrlEncoding {
    case json
    case url
}

class Request {
    
    fileprivate static var baseURL: String = NetworkConstants.Config.BaseURL
    fileprivate static var url: String = baseURL
    fileprivate static var method: Alamofire.HTTPMethod = .get
    fileprivate static var parameters: [String: Any] = [:]
    fileprivate static var data: Data = Data()
    fileprivate static var headers: [String: String] = [:]
    fileprivate static var encoding: ParameterEncoding = URLEncoding.queryString
    fileprivate static let disposeBag = DisposeBag()
    
    public static func method(_ method: Method) -> Request.Type {
        self.method = HTTPMethod(rawValue: method.rawValue)!
        return self
    }
    
    public static func queryParameters(_ parameters: [String: Any]) -> Request.Type {
        self.parameters = parameters
        self.parameters["api_key"] = "51c0a758d5713ea61827aab48b4664d0"
        return self
    }
    
    public static func header(_ headers: [String: String]) -> Request.Type {
        self.headers = headers
        self.headers["Content-Type"] = "application/json"
        self.headers["Accept-Encoding"] = "application/gzip"
        return self
    }

    public static func encodParameters(_ encoding: UrlEncoding) -> Request.Type {
        
        self.encoding = encoding == .json ? JSONEncoding.default : URLEncoding.queryString
        return self
    }
   
    public static func request() -> Observable<(HTTPURLResponse, Any)> {

        let result = Request.sharedManager
            .rx.responseJSON(method, url, parameters: parameters, encoding: encoding, headers: headers)
        
        return result
        
    }

}

typealias RequestURL = Request
extension RequestURL {
    public static func fromPathURL(_ path: String) -> Request.Type {
        self.url = baseURL + path
        return self
    }
}


