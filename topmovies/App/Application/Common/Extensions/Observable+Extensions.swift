//
//  Observable+Extensions.swift
//  topmovies
//
//  Created by HugoSilva on 3/23/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UIScrollView {
    var reachedBottom: ControlEvent<Void> {
        let observable = contentOffset
            .flatMap { [weak base] contentOffset -> Observable<Void> in
                guard let scrollView = base else {
                    return Observable.empty()
                }
                
                let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
                let y = contentOffset.y + scrollView.contentInset.top
                let threshold = max(0.0, scrollView.contentSize.height - visibleHeight)
                return y > threshold ? Observable.just(Void()) : Observable.empty()
        }
        
        return ControlEvent(events: observable)
    }
}

extension Driver {
    func loadMoreObserver<T>(initialPage: Int, size: Int, loader: @escaping (_ size: Int, _ page: Int) -> Driver<[T]>) -> Driver<[T]> {
        var isLoading = false
        var actualPage = initialPage
        return self.map {res -> Bool in
            return isLoading
            }.asObservable().filter({ (resp) -> Bool in
                return resp == false
            }).scan(initialPage) { oldValue, newValue in
                actualPage = oldValue + 1
                return actualPage
            }.distinctUntilChanged().flatMapLatest {page -> SharedSequence<DriverSharingStrategy, [T]> in
                isLoading = true
                if page == 1 {
                    return Driver.just([T]())
                } else {
                    return loader(size, page).asDriver()
                }
            }.scan([T]()) { oldValue, newValue in
                isLoading = (newValue.count < size && actualPage > 1)
                return oldValue + newValue
                
            }.asDriver(onErrorJustReturn: [T]())
    }
}
