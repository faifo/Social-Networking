//
//  HorizontalLabelCollectionViewCell.swift
//  Quickscop
//
//  Created by GnolDrol on 10/31/21.
//

import UIKit

class HorizontalLabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    static let identifier = "HorizontalLabelCollectionViewCell"
    static let itemheight = 30.0
    static let labelHeight = 19.0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.font = AppFont.semiBold(size: 12)
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 14.5
        
    }
    
    func setSelected(isSelected : Bool) {
        if isSelected {
            containerView.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: self.containerView.frame, andColors: [AppColor.mainGradientStart, AppColor.mainGradientEnd])
            containerView.layer.borderWidth = 0
            containerView.layer.borderColor = UIColor.white.cgColor
            label.textColor = UIColor.white
        } else {
            containerView.backgroundColor = UIColor.white
            containerView.layer.borderWidth = 2
            containerView.layer.borderColor = AppColor.mainGradientEnd.cgColor
            label.textColor = AppColor.mainGradientEnd
        }
    }
    

}
