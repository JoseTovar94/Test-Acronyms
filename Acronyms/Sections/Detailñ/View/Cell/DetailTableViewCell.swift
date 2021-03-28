//
//  DetailTableViewCell.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 28/03/21.
//

import UIKit
import Material

class DetailTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var sinceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewContainer.depth = Depth(offset: .zero, opacity: 0.1, radius: 10)
        viewContainer.layer.cornerRadius = 15.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(viewModel: Abbreviation.Expression?) {
        titleLabel.text = viewModel?.word
        frequencyLabel.text = String(viewModel?.frequency ?? 0)
        sinceLabel.text = String(viewModel?.since ?? 0)
    }
    
}
