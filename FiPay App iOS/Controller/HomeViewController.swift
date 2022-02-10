

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var balanceLbl: UILabel!
    
    @IBOutlet weak var homeScreenPurchases: UITableView!
    
    
    //MARK: - Array
    
    var bills: [Bill] = [
        Bill(value: 50.0, date: "December/07/2021", description: "Purchase made in McDonald's"),
        Bill(value: 35.50, date: "August/25/2021", description: "Deposit made"),
        Bill(value: 9.90, date: "July/05/2021", description: "Transfer made"),
        Bill(value: 12.33, date: "May/04/2021", description: "Purchase made in Starbucks"),
        Bill(value: 4.50, date: "April/15/2021", description: "Deposit"),
        Bill(value: 213.74, date: "April/22/2021", description: "Transfer"),
        Bill(value: 1570.54, date: "July/18/2021", description: "Purchase made in Amazon"),
        Bill(value: 37.94, date: "September/06/2021", description: "Deposit"),
        Bill(value: 12.78, date: "March/09/2021", description: "Deposit"),
        Bill(value: 34.76, date: "October/02/2021", description: "Purchase made in Burguer King"),
        
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeScreenPurchases.dataSource = self
        homeScreenPurchases.register(UINib(nibName: "PurchaseCell", bundle: nil), forCellReuseIdentifier: "PurchaseCell")
        
        func getAccount() {
            guard let url = URL(string: "https://fipaydebonaire.herokuapp.com/compras-feitas/") else { return }
            
            let session = URLSession.shared.dataTask(with: url) { data, response, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    guard let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] else { return }
                    DispatchQueue.main.async {
                        
                        print(jsonRes["id"])
                        print(jsonRes["description"])
                        print(jsonRes["cash_value"])
                        print(jsonRes["date"])
                        print(jsonRes["cliente"])
        
                    }
                    
                    
                }
                
                
            }.resume()
        }
        
        
    }
    
    //MARK: - Buttons
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
    }
    
}

//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell", for: indexPath) as! PurchaseCell
        cell.descriptionLbl.text = bills[indexPath.row].description
        cell.dateLbl.text = bills[indexPath.row].date
        cell.valueLbl.text = "$\(String(bills[indexPath.row].value))"
        return cell
    }
    
    
}

