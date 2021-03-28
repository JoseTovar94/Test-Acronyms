//
//  SearchViewController.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyImage: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    // MARK: - Vars
    private lazy var modelController: SearchViewModelController = {
        let modelController = SearchViewModelController()
        modelController.attach(view: self)
        return modelController
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupTableView()
        modelController.viewDidLoad()
    }
}
// MARK: - View Model Protocol
extension SearchViewController: SearchProtocol {
    
    func reloadUI() {
        emptyImage.isHidden = true
        emptyLabel.isHidden = true
        tableView.reloadData()
        if modelController.viewModel.isEmpty {
            emptyImage.isHidden = false
            emptyLabel.isHidden = false

        }
    }
}

// MARK: - Table DataSource & Delegate
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        tableView.register(cell: .SearchTableViewCell, identifier: .SearchTableViewCell)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelController.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelController.viewModel[section].abbreviationArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell {
            cell.selectionStyle = .none
            cell.setup(viewModel: modelController.viewModel[indexPath.section].abbreviationArray?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        let siguienteViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        siguienteViewController.resultViewModel = modelController.viewModel[indexPath.section].abbreviationArray?[indexPath.row]
        navigationController?.pushViewController(siguienteViewController, animated: true)
        
    }
}
// MARK: - Search Delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        modelController.loadResult(textSearch: searchText)
    }
}
