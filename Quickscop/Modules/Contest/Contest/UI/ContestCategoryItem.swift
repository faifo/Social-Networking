//
//  ContestCategoryItem.swift
//  Quickscop
//
//  Created by GnolDrol on 10/31/21.
//

import UIKit

class ContestCategoryItem: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    static let cellSize = CGSize(width: 194, height: 116)
    static let identifier = "ContestCategoryItem"
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 18
        // Initialization code
    }

}
