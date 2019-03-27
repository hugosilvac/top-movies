//
//  Navigation+Push.swift
//  topmovies
//
//  Created by HugoSilva on 3/24/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import UIKit

struct Navigation {
    
    static func pushTabBarViewController(viewController: UIViewController, movie: Movie, animation: Bool = true){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InfoMovieViewController") as? InfoMovieViewController
        vc!.movie = movie
        viewController.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
