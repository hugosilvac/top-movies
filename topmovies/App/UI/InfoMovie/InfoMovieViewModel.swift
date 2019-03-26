//
//  InfoMovieViewModel.swift
//  topmovies
//
//  Created by HugoSilva on 3/25/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import RxSwift

class InfoMovieViewModel {

    private let movieWorker = MovieBusinesskWorker()
    private let genderWorker = GenderBusinessWorker()
    
    func saveMovie(movie: Movie) -> Bool {
        return movieWorker.saveMovie(movie: movie)
    }
    
    func genderMovies(language: String) -> Observable<[Gender]> {
        return genderWorker.genderMovies(language:language)
    }
}
