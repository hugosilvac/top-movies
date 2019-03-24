//
//  ManagerImage.swift
//  topmovies
//
//  Created by HugoSilva on 3/23/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import UIKit

struct ManagerImage {

    static func linkImage(finalUrl: String) -> String {
        
        let urlImage = Constants.Config.ImageURL + ImageSize.W185.rawValue + finalUrl
        
        return urlImage
    }
    
}
