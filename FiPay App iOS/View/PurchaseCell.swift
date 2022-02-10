

import UIKit

class PurchaseCell: UITableViewCell {

    @IBOutlet weak var purchaseIcon: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        purchaseIcon.layer.cornerRadius = 8
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    
}
