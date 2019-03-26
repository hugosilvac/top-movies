//
//  MoviePersistenceWorker.swift
//  topmovies
//
//  Created by HugoSilva on 3/24/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift
import RealmSwift

public class MoviePersistenceWorker: MoviePersistenceContract {

    public init() {}
    
    public func saveMovie(movie: MoviePersistenceModel) -> Bool {
        try? ConnectionRealm.realm.write {
            ConnectionRealm.realm.add(movie, update: true)
        }
        
        if let movie = getMovie(id: movie.id) {
            return true
        }else {
            return false
        }
        
    }
    
    public func favoriteMovies() -> Observable<Results<MoviePersistenceModel>> {
        return Observable<Results<MoviePersistenceModel>>.create { observer in
            observer.on(.next(
                ConnectionRealm.realm.objects(MoviePersistenceModel.self)
                )
            )
            return Disposables.create()
        }
    }
    
    
    private func getMovie(id: Int) -> MoviePersistenceModel? {
        return ConnectionRealm.realm.objects(MoviePersistenceModel.self).filter("id = %@", id).first
    }

}
