//
//  SearchViewModelController.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import Foundation
import UIKit

class SearchViewModelController {
    
    // MARK: - Vars
    private var view: SearchProtocol?
    var viewModel = [SearchViewModel]() {
        didSet {
            view?.reloadUI()
        }
    }
    
    // MARK: - Life cycle
    func attach(view: SearchProtocol) {
        self.view = view
    }

    func viewDidLoad() {
        loadResult()
    }
    // MARK: - Life cycle
    func loadResult(textSearch: String = "") {
        let apiRoute = APIRoute<APIRequestParams.Search>.Search()
        apiRoute.params = textSearch.contains(" ") ? .init(abbreviation: "", word: textSearch) : .init(abbreviation: textSearch, word: "")

        UIApplication.showHUD()
        APINetworking.request(route: apiRoute) { (response: [SearchModel]) in
            let results = response.map{SearchViewModel.init(abbreviationArray: $0.abbreviationArray, abbreviation: $0.abbreviation)}
            self.viewModel = results
            UIApplication.dismissHUD()
            
        }onError: { (error) in
            print("Error")
            UIApplication.dismissHUD()
        }
    }
}




