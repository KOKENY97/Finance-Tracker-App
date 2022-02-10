//
//  TransferCell.swift
//  FiPay App iOS
//
//  Created by user209843 on 2/3/22.
//

import UIKit

class TransferCell: UITableViewCell {
    
    @IBOutlet weak var transferImage: UIImageView!
    @IBOutlet weak var transferRecipient: UILabel!
    @IBOutlet weak var trasnferDate: UILabel!
    @IBOutlet weak var transferValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        transferImage.layer.cornerRadius = 65 / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
