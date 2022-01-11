//
//  ImageCell.swift
//  Quickscop
//
//  Created by GnolDrol on 10/27/21.
//

import UIKit

class ImageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "ImageCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        // Initialization code
    }

}
