//
//  RequestManager.swift
//  topmovies
//
//  Created by HugoSilva on 3/21/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift
import Alamofire
import RxAlamofire

class RequestManager {
    
    static let shared = RequestManager()

    func fetch(url: String, method: Method = .GET, parameters: [String: Any] = [:], headers: [String: String] = [:], encoding: UrlEncoding = .url, schedulerType: SchedulerType = SerialDispatchQueueScheduler.init(qos: .background), scheduler: ImmediateSchedulerType = MainScheduler.instance, retries: Int = 1) -> Observable<String> {
        
        return observable(url: url, method: method, parameters: parameters, headers: headers, encoding: encoding)
            .subscribeOn(schedulerType)
            .do(onNext: { _ in UIApplication.shared.isNetworkActivityIndicatorVisible = true })
            .mapRequestJson()
            .observeOn(scheduler)
            .retry(retries)
            .do(onNext: { _ in UIApplication.shared.isNetworkActivityIndicatorVisible = false })
    }
    
}
