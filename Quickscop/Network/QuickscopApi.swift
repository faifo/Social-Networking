//
//  QuickscopApi.swift
//  Quickscop
//
//  Created by GnolDrol on 11/11/21.
//

import Foundation
import Moya


public enum QuickScop {
    case register(
        first_name : String,
        last_name : String,
        username : String,
        email: String,
        password : String,
        password_confirmation : String
    )
}

