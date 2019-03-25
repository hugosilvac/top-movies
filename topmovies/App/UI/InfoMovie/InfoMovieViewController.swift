//
//  InfoMovieViewController.swift
//  topmovies
//
//  Created by HugoSilva on 3/24/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import UIKit

class InfoMovieViewController: UIViewController {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var durationMovie: UILabel!
    @IBOutlet weak var genreMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UITextView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var backgroundMovie: UIImageView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageMovie.af_setImage(withURL:  URL(string: ManagerImage.linkImage(finalUrl: movie!.posterPath))!)
        backgroundMovie.af_setImage(withURL:  URL(string: ManagerImage.linkImage(finalUrl: movie!.backdropPath))!)
        nameMovie.text = movie?.title
        durationMovie.text = "oo"
        genreMovie.text = "dd"
        descriptionMovie.text = movie?.overview
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
