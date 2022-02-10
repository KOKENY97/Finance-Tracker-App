
import Foundation
import UIKit

class NotificationViewController: UIViewController {
    
//MARK: - Outlets
    
    @IBOutlet weak var notificationView: UITableView!
    
//MARK: - Array
    
    var transfers: [Transfer] = [
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
        Transfer(value: 43.59, date: "January 21, 2022", description: "Transfered to", recipient: "123.456.789-00"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationView.dataSource = self
        notificationView.register(UINib(nibName: "TransferCell", bundle: nil), forCellReuseIdentifier: "TransferCell")
        
    }
    
}

//MARK: - UITableViewDataSource

extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transfers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransferCell", for: indexPath) as! TransferCell
        cell.transferRecipient.text = transfers[indexPath.row].recipient
        cell.trasnferDate.text = transfers[indexPath.row].date
        cell.transferValue.text = "$\(String(transfers[indexPath.row].value))"
        return cell
    }
    
    
    
    
}
