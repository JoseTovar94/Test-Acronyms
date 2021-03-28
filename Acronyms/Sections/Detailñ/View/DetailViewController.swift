//
//  DetailViewController.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var frecuencyLabel: UILabel!
    @IBOutlet weak var sinceLabel: UILabel!
    
    
    // MARK: - Vars
    var resultViewModel: Abbreviation? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"

        setupTableView()
        wordLabel.text = resultViewModel?.word
        frecuencyLabel.text = String(resultViewModel?.frequency ?? 0)
        sinceLabel.text = String(resultViewModel?.since ?? 0)
    }
    
    func updateView () {
        if resultViewModel == nil {
            tableView.reloadData()
        }
    }
}
// MARK: - Table DataSource & Delegate
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        tableView.register(cell: .DetailTableViewCell, identifier: .DetailTableViewCell)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultViewModel?.expressions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell {
            cell.selectionStyle = .none
            cell.setup(viewModel: resultViewModel?.expressions?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

