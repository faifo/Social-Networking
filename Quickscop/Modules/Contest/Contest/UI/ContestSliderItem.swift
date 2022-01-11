//
//  ContestSliderItem.swift
//  Quickscop
//
//  Created by GnolDrol on 10/31/21.
//

import UIKit

class ContestSliderItem: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lbl_number: UILabel!
    @IBOutlet weak var lbl_category: UILabel!
    static let identifier = "ContestSliderItem"
    static let cellHeight = 177.0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 13
        collectionView.collectionViewLayout = layout
    }

}
