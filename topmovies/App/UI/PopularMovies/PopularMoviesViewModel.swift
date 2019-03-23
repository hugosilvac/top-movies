//
//  PopularMoviesViewModel.swift
//  topmovies
//
//  Created by HugoSilva on 3/23/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift
import RxCocoa

class PopularMoviesViewModel {

    private let movieWorker = MovieBusinesskWorker()
    
    struct Input {
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
        let loadNextPageTrigger: Driver<Void>
    }
    
    struct Output {
        let fetchingTop: Driver<Bool>
        let fetchingBottom: Driver<Bool>
        let post: Driver<[Movie]>
        let selectedPost: Driver<Movie>
        let error: Driver<Error>
    }
    
    func transform(input: PopularMoviesViewModel.Input, page: Int, language: String) -> PopularMoviesViewModel.Output {
        
        let errorMovie = ErrorTracker()
        let activityTopIndicator = ActivityIndicator()
        let activityBottomIndicator = ActivityIndicator()
        
        let initialMovies = input.trigger.flatMapLatest {_ in
            return self.movieWorker.popularMovies(page: page, language: language)
                .trackActivity(activityTopIndicator)
                .trackError(errorMovie)
                .asDriverOnErrorJustComplete()
        }
        
                
        let loadMoreMovies = input.loadNextPageTrigger.loadMoreObserver(initialPage: 0, size: Constants.RequestMovieParameters.Size) { (size, page) -> SharedSequence<DriverSharingStrategy, [Movie]> in
            return self.movieWorker.popularMovies(page: page, language: language)
                .trackActivity(activityBottomIndicator)
                .asDriver(onErrorJustReturn: [Movie]())
        }
        
        let moreMovies = Driver.combineLatest(initialMovies, loadMoreMovies)
            .flatMapLatest {
                return Driver.just($0 + $1)
        }
        
        let selectedPost = input.selection
            .withLatestFrom(moreMovies) { (indexPath, arrayMovies) -> Movie in
                return arrayMovies[indexPath.row]
        }
        
        let errors = errorMovie.asDriver()
        let fetchingTop = activityTopIndicator.asDriver()
        let fetchingBottom = activityBottomIndicator.asDriver()
     
        return Output(fetchingTop: fetchingTop,
                      fetchingBottom: fetchingBottom,
                      post: moreMovies,
                      selectedPost: selectedPost,
                      error: errors)
        
    }
    
}
