//
//  Catalogs.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import Foundation
import UIKit

enum StoryboardCatalog: String {
    case Splash
    case Search
    case Detail

    func createInstance() -> UIStoryboard {
        return UIStoryboard(name: String(describing: self), bundle: nil)
    }
}
enum TableViewCellCatalog: String {
    case SearchTableViewCell
    case DetailTableViewCell
}
enum CellReuseIdentifierAll: String {
    case SearchTableViewCell
    case DetailTableViewCell
}

enum ViewControllerCatalog: RawRepresentable {
    case Splash
    case Search
    case Detail
    case LoginNavigation
    
    var rawValue: (class: AnyClass, storyboard: StoryboardCatalog) {
        switch self {
        case .Splash:                    return (SplashViewController.self, .Splash)
        case .Search:                    return (SearchViewController.self, .Search)
        case .Detail:                     return (DetailViewController.self, .Detail)
        case .LoginNavigation:          return (SearchNavigationController.self, .Search)

        }
    }
    
}
extension ViewControllerCatalog: CaseIterable {
    init?(rawValue: (class: AnyClass, storyboard: StoryboardCatalog)) {
        return nil
    }
    
    init?(name: String) {
        for item in ViewControllerCatalog.allCases where String(describing: item) == name {
            self = item
            return
        }
        return nil
    }
    
    var className: String {
        return String(describing: self.rawValue.class)
    }
    
    var name: String {
        return String(describing: self)
    }
    
    func createInstance() -> UIViewController? {
        let sb = self.rawValue.storyboard.createInstance()
        let vc = sb.instantiateViewController(withIdentifier: String(describing: self.rawValue.class))
        return vc
    }
}
