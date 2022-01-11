//
//  QuickscopApiTargetType.swift
//  Quickscop
//
//  Created by GnolDrol on 11/11/21.
//

import Foundation
import Moya

extension QuickScop : TargetType {
 
    public var baseURL: URL { URL(string: "http://api.quickscop.com")! }
    
    public var path: String {
        switch self {
        case .register:
            return "/auth/register"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .register:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case let .register(first_name, last_name, username, email, password, password_confirmation):
            return .requestCompositeParameters(bodyParameters: [
                "first_name" : first_name,
                "last_name" : last_name,
                "username" : username,
                "email" : email,
                "password" : password,
                "password_confirmation" : password_confirmation,

            ], bodyEncoding: URLEncoding.httpBody, urlParameters: [:])
        }
    }

    public var headers: [String: String]? { nil }
}
