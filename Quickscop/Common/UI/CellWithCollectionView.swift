//
//  CellWithCollectionView.swift
//  Quickscop
//
//  Created by Solo on 06/11/2021.
//

import UIKit

class CellWithCollectionView: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    static let identifier = "CellWithCollectionView"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setBorder() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = AppColor.mainGradientEnd.cgColor
    }
    
    func removeBorder() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 0
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
}
