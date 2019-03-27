//
//  FavoriteViewModel.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift
import RxCocoa

class FavoriteViewModel: NSObject {

    private let movieWorker = MovieBusinesskWorker()
    
    struct Input {
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let fetchingTop: Driver<Bool>
        let post: Driver<[Movie]>
        let selectedPost: Driver<Movie>
        let error: Driver<Error>
    }
    
    func transform(input: FavoriteViewModel.Input) -> FavoriteViewModel.Output {
        
        let errorMovie = ErrorTracker()
        let activityTopIndicator = ActivityIndicator()
        
        let movies = input.trigger.flatMapLatest {_ in
            return self.movieWorker.favoriteMovies()
                .trackActivity(activityTopIndicator)
                .trackError(errorMovie)
                .asDriverOnErrorJustComplete()
        }
        
        let selectedPost = input.selection
            .withLatestFrom(movies) { (indexPath, arrayMovies) -> Movie in
                return arrayMovies[indexPath.row]
        }
        
        let errors = errorMovie.asDriver()
        let fetchingTop = activityTopIndicator.asDriver()
        
        return Output(fetchingTop: fetchingTop,
                      post: movies,
                      selectedPost: selectedPost,
                      error: errors)
        
    }
    
}
