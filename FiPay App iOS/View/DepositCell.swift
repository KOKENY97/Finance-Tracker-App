//
//  DepositCell.swift
//  FiPay App iOS
//
//  Created by user209843 on 2/3/22.
//

import UIKit

class DepositCell: UITableViewCell {
    
    @IBOutlet weak var depositDescriptionLbl: UILabel!
    @IBOutlet weak var depositDateLbl: UILabel!
    @IBOutlet weak var depositValueLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
