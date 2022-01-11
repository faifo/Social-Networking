//
//  ContestAllCategoriesItem.swift
//  Quickscop
//
//  Created by GnolDrol on 11/1/21.
//

import UIKit

class ContestAllCategoriesItem: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "ContestAllCategoriesItem"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        collectionView.collectionViewLayout = layout
    }

}
