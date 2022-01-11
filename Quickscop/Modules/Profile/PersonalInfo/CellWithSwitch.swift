//
//  CellWithSwitch.swift
//  Quickscop
//
//  Created by GnolDrol on 11/8/21.
//

import UIKit

class CellWithSwitch: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    static let identifier = "CellWithSwitch"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
