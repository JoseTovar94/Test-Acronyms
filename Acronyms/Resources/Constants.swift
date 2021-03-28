//
//  Constants.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import Foundation


struct Constants {
    struct Request {
        
        // MARK: Base
        #if DEVELOPMENT
        static var apiBaseURL = "http://www.nactem.ac.uk"
        #else
        static var apiBaseURL = "http://www.nactem.ac.uk"
        #endif
        
        // MARK: url
        static let acromine = "/software/acromine/dictionary.py"
    }
    
    struct AppFonts {
        static let regular = "DMSans-Regular"
        static let bold = "DMSans-Bold"
        static let italic = "DMSans-Italic"
        static let medium = "DMSans-Medium"
    }
}
