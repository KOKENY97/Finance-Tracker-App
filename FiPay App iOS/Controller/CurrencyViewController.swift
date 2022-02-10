//
//  CurrencyViewController.swift
//  FiPay App iOS
//
//  Created by user209843 on 2/3/22.
//

import Foundation
import UIKit

class CurrencyViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var depositsTableView: UITableView!
    @IBOutlet weak var thisWeekView: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var rendimentoLbl: UILabel!
    
    @IBOutlet weak var incomeLbl: UILabel!
    @IBOutlet weak var outcomeLbl: UILabel!
    
    //MARK: - Array
    
    var deposits: [Deposit] = [
        Deposit(value: 50.00, date: "12/04/2021", description: "Deposit test"),
        Deposit(value: 50.00, date: "12/04/2021", description: "Deposit test"),
        Deposit(value: 50.00, date: "12/04/2021", description: "Deposit test"),
        Deposit(value: 50.00, date: "12/04/2021", description: "Deposit test"),
        Deposit(value: 50.00, date: "12/04/2021", description: "Deposit test"),
        Deposit(value: 50.00, date: "12/04/2021", description: "Deposit test"),
        Deposit(value: 50.00, date: "12/04/2021", description: "Deposit test"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Layouts
        thisWeekView.layer.borderWidth = 1.5
        thisWeekView.layer.borderColor = UIColor.white.cgColor
        thisWeekView.layer.cornerRadius = 8
        
        mainView.layer.borderWidth = 1.5
        mainView.layer.borderColor = UIColor.systemBlue.cgColor
        mainView.layer.cornerRadius = 8
        
        depositsTableView.dataSource = self
        depositsTableView.register(UINib(nibName: "DepositCell", bundle: nil), forCellReuseIdentifier: "DepositCell")
        
    }
    
    
    //MARK: - Buttons
    
    @IBAction func calendarButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "statToCalendar", sender: self)
    }
    

}

//MARK: - UITableViewDataSource

extension CurrencyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deposits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepositCell", for: indexPath) as! DepositCell
        cell.depositDescriptionLbl.text = deposits[indexPath.row].description
        cell.depositDateLbl.text = deposits[indexPath.row].date
        cell.depositValueLbl.text = "$\(deposits[indexPath.row].value)"
        
        return cell
    }
}
