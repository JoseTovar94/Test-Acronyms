//
//  APIRequestParams.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import Foundation

struct APIRequestParams {
    
    struct Search: Codable {
        var abbreviation: String
        var word: String

        private enum CodingKeys: String, CodingKey {
            case abbreviation = "sf"
            case word = "lf"
        }
        
    }
}
