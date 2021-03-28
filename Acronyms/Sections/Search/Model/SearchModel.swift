//
//  SearchModel.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import Foundation

struct SearchModel: Codable {
    let abbreviation: String?
    let abbreviationArray: [Abbreviation]?
    
    enum CodingKeys: String, CodingKey {
        case abbreviation = "sf"
        case abbreviationArray = "lfs"
    }
}
struct Abbreviation: Codable {
    
    let word: String?
    let frequency: Int?
    let since: Int?
    let expressions: [Expression]?
    
    struct Expression: Codable {
        let word: String?
        let frequency, since: Int?
        
        enum CodingKeys: String, CodingKey {
            case word = "lf"
            case frequency = "freq"
            case since
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case word = "lf"
        case frequency = "freq"
        case since
        case expressions = "vars"
    }
}
