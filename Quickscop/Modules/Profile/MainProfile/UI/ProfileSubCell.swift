//
//  ProfileSubCell.swift
//  Quickscop
//
//  Created by Solo on 06/11/2021.
//

import UIKit

class ProfileSubCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblPoint: UILabel!
    @IBOutlet weak var pointContainer: UIView!
    @IBOutlet weak var img_Avatar: UIImageView!
    static let identifier = "ProfileSubCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        container.layer.masksToBounds = true
        container.layer.cornerRadius = 8
        container.layer.borderWidth = 1.0
        container.layer.borderColor = AppColor.mainGradientEnd.cgColor
        
        img_Avatar.layer.masksToBounds = true
        img_Avatar.layer.cornerRadius = 10
        
        pointContainer.layer.masksToBounds = true
        pointContainer.layer.cornerRadius = 10
        pointContainer.layer.borderColor = AppColor.mainGradientEnd.cgColor
        pointContainer.layer.borderWidth = 1
        
        lblPoint.layer.masksToBounds = true
        lblPoint.layer.cornerRadius = 8
        lblPoint.backgroundColor = AppColor.gradientWithFrame(frame: lblPoint.frame)
        
        btnDelete.layer.masksToBounds = true
        btnDelete.layer.cornerRadius = 10
        btnDelete.setAttributedTitle(NSAttributedString(string: "Delete", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : AppFont.semiBold(size: 8)
        ]), for: .normal)
        
        btnDelete.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: self.frame, andColors: [AppColor.mainGradientStart, AppColor.mainGradientEnd])
    }

}
