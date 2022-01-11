//
//  String+Extension.swift
//  Quickscop
//
//  Created by Solo on 22/10/2021.
//

import UIKit

extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
     }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

extension NSMutableAttributedString {

    func setAttachmentsAlignment(_ alignment: NSTextAlignment) {
        self.enumerateAttribute(NSAttributedString.Key.attachment, in: NSRange(location: 0, length: self.length), options: .longestEffectiveRangeNotRequired) { (attribute, range, stop) -> Void in
            if attribute is NSTextAttachment {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = alignment
                self.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            }
        }
    }

}

