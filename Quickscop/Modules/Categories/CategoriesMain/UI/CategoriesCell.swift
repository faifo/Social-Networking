//
//  CategoriesCell.swift
//  Quickscop
//
//  Created by GnolDrol on 11/3/21.
//

import UIKit

class CategoriesCell: UICollectionViewCell {

    @IBOutlet weak var imgv_bottomRight: UIImageView!
    @IBOutlet weak var imgv_bottomLeft: UIImageView!
    @IBOutlet weak var imgv_Top: UIImageView!
    @IBOutlet weak var btn_star: UIButton!
    @IBOutlet weak var top_title: UILabel!
    static let identifier = "CategoriesCell"
    static let cellHeight = 186.0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgv_Top.layer.masksToBounds = true
        imgv_Top.layer.cornerRadius = 3
        
        imgv_bottomLeft.layer.masksToBounds = true
        imgv_bottomLeft.layer.cornerRadius = 3
        
        imgv_bottomRight.layer.masksToBounds = true
        imgv_bottomRight.layer.cornerRadius = 3
    }

}
