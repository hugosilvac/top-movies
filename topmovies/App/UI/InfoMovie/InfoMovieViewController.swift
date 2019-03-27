//
//  InfoMovieViewController.swift
//  topmovies
//
//  Created by HugoSilva on 3/24/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import UIKit
import RxSwift
import EZRatingView

class InfoMovieViewController: UIViewController {

    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var genreMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UITextView!
    @IBOutlet weak var backgroundMovie: UIImageView!
    @IBOutlet var ratingView: EZRatingView!
    
    var isFavorite: Bool = false
    let infoMovieViewModel = InfoMovieViewModel()
    private var resultGender: [Genre] = [Genre]()
    private let disposeBag = DisposeBag()
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fieldView()
        checkIsFavorite()
    }
    
    private func checkIsFavorite() {
        if infoMovieViewModel.isFavorite(id: (movie?.id)!) {
            isFavorite = true
            configurationView(title: "Remover")
        }else{
            isFavorite = false
            configurationView(title: "Adicionar")
            genderMovies()
        }
        
    }
    
    private func configurationView(title: String) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(rightButton))
    }
    
    private func fieldView() {
        imageMovie.af_setImage(withURL:  URL(string: ManagerImage.linkImage(finalUrl: movie!.posterPath))!)
        backgroundMovie.af_setImage(withURL:  URL(string: ManagerImage.linkImage(finalUrl: movie!.backdropPath))!)
        nameMovie.text = movie?.title
        ratingView.value = CGFloat(defineRating(average: (movie?.voteAverage)!))
        descriptionMovie.text = movie?.overview
    }
    
    private func defineRating(average: Double) -> Double {
        return average/2
    }
    
    @objc func rightButton() {
        
        if isFavorite {
            _ = infoMovieViewModel.deleteMovie(movie: movie!)
            isFavorite = false
        }else{
            _ = infoMovieViewModel.saveMovie(movie: movie!, arrayGenre: resultGender)
            isFavorite = true
        }
        checkIsFavorite()
    }

    func genderMovies() {
        infoMovieViewModel.genderMovies(language: Constants.RequestMovieParameters.Language)
            .subscribe(onNext: { arrayGender in
                
                var strGenre = ""
                for  (index, gender) in (self.movie?.genreIds)!.enumerated() {
                    if let objectGender = arrayGender.first(where: {$0.id == gender}) {
                        // do something with foo
                        self.resultGender.append(objectGender)
                        strGenre = index == 0 ? "\(objectGender.name)" :  "\(strGenre), \(objectGender.name)"
                    }
                }
                self.genreMovie.text = strGenre
                
            }, onError: { error in
                 print("Error:\(error)")
            }).disposed(by: disposeBag)
    }
    
}
