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
    @IBOutlet weak var nameMovie: UILabel!
    
    var gradientLayer: CAGradientLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageMovie.backgroundColor = UIColor.lightGray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageMovie.af_cancelImageRequest()
        imageMovie.image = nil
    }

    func albumDefaultCell(strImage: String, nameMovie: String) {
        imageMovie.af_setImage(withURL:  URL(string: strImage)!)
        self.nameMovie.text = nameMovie
        self.nameMovie.textColor = UIColor.white
        gradientView(imageView: imageMovie)
    }
    
    private func gradientView(imageView: UIImageView) {
        if gradientLayer == nil {
            
            gradientLayer = CAGradientLayer()
            gradientLayer?.frame = self.bounds
            gradientLayer?.colors = [UIColor.clear.cgColor,
                                     UIColor.clear.cgColor,
                                     UIColor.clear.cgColor,
                                     UIColor.black.withAlphaComponent(0.3).cgColor,
                                     UIColor.black.withAlphaComponent(0.5).cgColor,
                                     UIColor.black.withAlphaComponent(0.8).cgColor]
            gradientLayer?.startPoint = CGPoint(x: self.center.x, y: 0.0)
            gradientLayer?.endPoint = CGPoint(x: self.center.x, y: 1.0)
            imageView.layer.addSublayer(gradientLayer!)
        }
    }
}
