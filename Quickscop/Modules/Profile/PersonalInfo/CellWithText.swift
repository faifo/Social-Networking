//
//  CellWithText.swift
//  Quickscop
//
//  Created by GnolDrol on 11/8/21.
//

import UIKit

class CellWithText: UITableViewCell {

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier = "CellWithText"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
