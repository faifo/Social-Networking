//
//  AppButton.swift
//  Quickscop
//
//  Created by Solo on 21/10/2021.
//

import Foundation
import UIKit

class AppButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    private func setUp() {
        titleLabel?.textColor = UIColor.white
        titleLabel?.font = AppFont.bold(size: 18)
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
    }
}

extension UIButton {
    func gradientButton(titleStr : String) {
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
        setAttributedTitle(NSAttributedString(string: titleStr, attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : AppFont.bold(size: 18)
        ]), for: .normal)
        
        backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: self.frame, andColors: [AppColor.mainGradientStart, AppColor.mainGradientEnd])
    }
    
    func clearButton(titleStr : String) {
        backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.2)
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
        setTitle(titleStr, for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = AppFont.bold(size: 18)
    }
    
     
}
