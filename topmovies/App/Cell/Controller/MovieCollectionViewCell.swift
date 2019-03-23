//
//  MovieCollectionViewCell.swift
//  topmovies
//
//  Created by HugoSilva on 3/23/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageMovie.backgroundColor = UIColor.lightGray
    }

    func albumDefaultCell(strImage: String) {
        imageMovie.af_setImage(withURL:  URL(string: strImage)!)
    }
    
}
