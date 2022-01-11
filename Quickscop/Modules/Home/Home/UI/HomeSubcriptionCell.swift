//
//  HomeSubcriptionCell.swift
//  Quickscop
//
//  Created by GnolDrol on 10/27/21.
//

import UIKit

class HomeSubcriptionCell: UITableViewCell {

    static let identifier = "HomeSubcriptionCell"
    @IBOutlet weak var lbl_top_title: UILabel!
    @IBOutlet weak var imgv_avatar: UIImageView!
    
    @IBOutlet weak var lbl_top_subTitle: UILabel!
    @IBOutlet weak var btn_more: UIButton!
    
    @IBOutlet weak var imgv_content: UIImageView!
    
    @IBOutlet weak var lbl_location: UILabel!
    
    @IBOutlet weak var lbl_views: UILabel!
    
    @IBOutlet weak var lbl_comment: UILabel!
    
    @IBOutlet weak var lbl_categories: UILabel!
    
    @IBOutlet weak var lbl_bottomTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgv_avatar.layer.masksToBounds = true
        imgv_avatar.layer.cornerRadius = 14
        imgv_avatar.layer.borderColor = AppColor.mainGradientEnd.cgColor
        imgv_avatar.layer.borderWidth = 1.0
        
        lbl_top_title.font = AppFont.bold(size: 14)
        lbl_top_subTitle.font = AppFont.semiBold(size: 10)
        lbl_top_subTitle.textColor = AppColor.gray
        
        lbl_location.font = AppFont.semiBold(size: 12)
        lbl_location.textColor = AppColor.gray
        
        lbl_views.font = AppFont.semiBold(size: 14)
        lbl_comment.font = AppFont.semiBold(size: 14)
        lbl_categories.font = AppFont.semiBold(size: 14)

        lbl_bottomTitle.font = AppFont.semiBold(size: 10)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
