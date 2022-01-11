//
//  NotificationCell.swift
//  Quickscop
//
//  Created by GnolDrol on 11/3/21.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var lbl_time: UILabel!
    @IBOutlet weak var lbl_subject: UILabel!
    @IBOutlet weak var lbl_action: UILabel!
    @IBOutlet weak var avatarContainer: UIView!
    @IBOutlet weak var imgv_Avatar: UIImageView!
    static let identifier = "NotificationCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        avatarContainer.layer.masksToBounds = true
        avatarContainer.layer.cornerRadius = 12
        avatarContainer.layer.borderColor = AppColor.mainGradientEnd.cgColor
        avatarContainer.layer.borderWidth = 1.0
        
        imgv_Avatar.layer.masksToBounds = true
        imgv_Avatar.layer.cornerRadius = 12
        
        let topStr = NSMutableAttributedString(string: "Someone", attributes: [
            .font: AppFont.semiBold(size: 14),
            .foregroundColor: UIColor.black
        ])
        topStr.append(NSMutableAttributedString(string: "a répondu à", attributes: [
            .font: AppFont.regular(size: 14),
            .foregroundColor: UIColor.black
        ]))
        
        lbl_action.attributedText = topStr
        
        lbl_subject.font = AppFont.semiBold(size: 14)
        lbl_subject.text = "Apple’s Fluid Interface Design"
        
        lbl_time.font = AppFont.regular(size: 14)
        lbl_time.textColor = UIColor(hexString: "A9A9A9")
        lbl_time.text = "2 days ago"
        
        
    }
    
}
