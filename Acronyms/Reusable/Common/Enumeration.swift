//
//  Enumeration.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import Foundation
import Alamofire

enum APIErrorEnum: String {
    case expiredOrMissingToken = "121"
}

enum ParamsEncoder: String {
    case json, url, multipart
    func toParameterEncoder() -> ParameterEncoder {
        switch self {
        case .json: return JSONParameterEncoder.default
        case .url: return URLEncodedFormParameterEncoder.default
        case .multipart: return URLEncodedFormParameterEncoder.default
        }
    }
}
