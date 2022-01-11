//
//  ErrorEntity.swift
//  Quickscop
//
//  Created by Solo on 11/11/2021.
//

import Foundation
import ObjectMapper

final class NWErrorObject : Mappable {
    var error : NWError?
    required init?(map: Map) {}
    func mapping(map: Map) {
        error <- map["error"]
    }
}

final class NWError : Mappable {
    var id : Int?
    var message : String?
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        message <- map["message"]
    }
}
