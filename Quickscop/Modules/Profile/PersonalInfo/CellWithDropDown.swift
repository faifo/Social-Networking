//
//  CellWithDropDown.swift
//  Quickscop
//
//  Created by GnolDrol on 11/8/21.
//

import UIKit

class CellWithDropDown: UITableViewCell {
    @IBOutlet weak var dropdownBtn: UIButton!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    static let identifier = "CellWithDropDown"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
