//
//  AppColor.swift
//  Quickscop
//
//  Created by GnolDrol on 10/27/21.
//

import Foundation
import ChameleonFramework

struct AppColor {
    static let gray = UIColor(hexString: "C2C2C2")!
    static let mainGradientStart = UIColor(hexString: "A062E4")!
    static let mainGradientEnd = UIColor(hexString: "614BE2")!
    static func gradientWithFrame(frame : CGRect) -> UIColor {
        return UIColor(gradientStyle: .topToBottom, withFrame: frame, andColors: [AppColor.mainGradientStart, AppColor.mainGradientEnd])
    }
}
