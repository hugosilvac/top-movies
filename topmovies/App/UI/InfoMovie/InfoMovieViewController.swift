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
    
    let infoMovieViewModel = InfoMovieViewModel()
    private var resultGender: [Gender] = [Gender]()
    private let disposeBag = DisposeBag()
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurationView()
        fieldView()
        genderMovies()
 
    }
    
    private func configurationView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(rightButton))
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
        if infoMovieViewModel.saveMovie(movie: movie!) {
            print("true")
        }else {
            print("false")
        }
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
