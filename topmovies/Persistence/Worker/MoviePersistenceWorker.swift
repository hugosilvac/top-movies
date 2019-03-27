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
        
        return (getMovie(id: movie.id) != nil) ? true : false
       
    }
    
    public func removeMovie(movie: MoviePersistenceModel) -> Bool {
        
        if let deleteMovie = getMovie(id: movie.id) {
            try? ConnectionRealm.realm.write {
                ConnectionRealm.realm.delete(deleteMovie)
            }
        }
        
        return (getMovie(id: movie.id) != nil) ? false : true
        
    }
    
    public func isFavorite(id: Int) -> Bool {
        
        return (getMovie(id: id) != nil) ? true : false
        
        
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
