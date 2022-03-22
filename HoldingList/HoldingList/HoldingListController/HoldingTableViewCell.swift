//
//  HoldingTableViewCell.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 19/03/22.
//

import UIKit

class HoldingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelSymbol: UILabel!
    @IBOutlet weak var labelQuantity: UILabel!
    @IBOutlet weak var labelLTP: UILabel!
    @IBOutlet weak var labelPL: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var modelHolding: Holding? {
        didSet {
            if let model = modelHolding {
                labelSymbol.text = model.symbol
                labelQuantity.text = "\(model.quantity)"
                labelLTP.text = "₹\(model.ltp)"
                let pl = String(format: "%.2f", model.getPLValue())
                labelPL.text = "₹\(pl)"
            }
        }
    }
}
