//
//  RecordingItem.swift
//  Quickscop
//
//  Created by Solo on 07/11/2021.
//

import UIKit

class RecordingItem: UICollectionViewCell {
    
    @IBOutlet weak var container: ShadowView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var rightLbl: UILabel!
    @IBOutlet weak var leftLbl: UILabel!
    
    static let identifier = "RecordingItem"
    static let ratioWidth = 181.0
    static let ratioHeight = 169.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img1.layer.masksToBounds = true
        img2.layer.masksToBounds = true
        img3.layer.masksToBounds = true
        img4.layer.masksToBounds = true
        
        img1.layer.cornerRadius = 5
        img2.layer.cornerRadius = 5
        img3.layer.cornerRadius = 5
        img4.layer.cornerRadius = 5

        container.layer.borderColor = AppColor.gray.cgColor
        container.layer.borderWidth = 1
        
        
    }
    
    func setLeftTitle(title : String) {
        leftLbl.text = title
    }
    
    func setRightTitle(title : String) {
        let fullString = NSMutableAttributedString(string: "")

        // create our NSTextAttachment
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "ic_photo")

        // wrap the attachment in its own attributed string so we can append it
        let image1String = NSAttributedString(attachment: image1Attachment)

        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: " \(title)"))

        // draw the result in a label
        rightLbl.attributedText = fullString
    }

}
