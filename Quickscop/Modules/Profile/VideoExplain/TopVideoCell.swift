//
//  TopVideoCell.swift
//  Quickscop
//
//  Created by Solo on 07/11/2021.
//

import UIKit

class TopVideoCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var thumbnailImgv: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    static let identifier = "TopVideoCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
