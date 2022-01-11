//
//  MiddleVideoCell.swift
//  Quickscop
//
//  Created by Solo on 07/11/2021.
//

import UIKit

class MiddleVideoCell: UITableViewCell {

    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    static let identifier = "MiddleVideoCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.layer.borderColor = AppColor.gray.cgColor
        containerView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
