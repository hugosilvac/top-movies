//
//  ExtensionApiObservableType.swift
//  topmovies
//
//  Created by HugoSilva on 3/21/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift
import RxAlamofire
import ObjectMapper

extension ObservableType {
    
    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { json -> Observable<T> in
            
            guard let jsonString = json as? String else {
                throw self.createError(code: -1, description: "ObjectMapper can't mapping")
            }
            
            guard let object = Mapper<T>().map(JSONString: jsonString) else {
                throw self.createError(code: -1, description: "ObjectMapper can't mapping")
            }
            
            return Observable.just(object)
        }
    }
    
    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { json -> Observable<[T]> in
            guard let objects = Mapper<T>().mapArray(JSONString: json as! String) else {
                throw self.createError(code: -1, description: "ObjectMapper can't mapping")
            }
            return Observable.just(objects)
        }
    }
    
    public func mapRequestJson() -> Observable<String> {
        return map { (arg) -> String in
            if let (response, json) = (arg as? (HTTPURLResponse, Any)) {
                
                if let error = self.checkResponseError(urlResponse: response, json: json) {
                    throw error
                }
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
                    if let string = String(data: data, encoding: String.Encoding.utf8) {
                        return string
                    }
                } catch {
                    throw error
                }
                
            }
            throw self.createError(code: -1, description: "Could not decode object")
        }
    }
    
    func checkResponseError(urlResponse: HTTPURLResponse, json: Any) -> NSError? {
        print(urlResponse.statusCode)
        if urlResponse.statusCode >= 400 {
            guard let json = json as? [String : Any] else {
                return self.createError(code: 1, description: "ObjectMapper can't mapping")
            }
            guard let description = (json["error_description"] as? String) else{
                return self.createError(code: urlResponse.statusCode, description: "Server Error")
            }
            return self.createError(code: urlResponse.statusCode, description: description)
        }
        return nil
    }
    
    private func createError(code: Int, description: String) -> NSError{
        return NSError(
            domain: "",
            code: code,
            userInfo: [NSLocalizedDescriptionKey: description])
    }
}
