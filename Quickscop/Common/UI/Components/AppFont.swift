//
//  AppFont.swift
//  Quickscop
//
//  Created by Solo on 21/10/2021.
//

import Foundation
import UIKit
struct AppFont {
    static func regular(size : CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size)!
    }
    
    static func medium(size : CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Medium", size: size)!
    }
    
    static func bold(size : CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
    
    static func semiBold(size : CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-SemiBold", size: size)!
    }
    
}
