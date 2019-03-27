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
    private let genreWorker = GenreBusinessWorker()
    
    func getMovie(id: Int) -> Movie? {
        return movieWorker.getMovie(id: id)
    }
    
    func saveMovie(movie: Movie, arrayGenre: [Genre]) -> Bool {
        return movieWorker.saveMovie(movie: movie, arrayGenre: arrayGenre)
    }
    
    func deleteMovie(movie: Movie) -> Bool {
        return movieWorker.deleteMovie(movie: movie)
    }
    
    func genderMovies(language: String) -> Observable<[Genre]> {
        return genreWorker.genreMovies(language:language)
    }
}
