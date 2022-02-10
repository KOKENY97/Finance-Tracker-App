

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class TransactionViewController: UIViewController {
    
//MARK: - Outlets
    
    @IBOutlet weak var outView: UIView!
    @IBOutlet weak var descriptionTxtView: UITextView!
    
    @IBOutlet weak var cashValueTxtField: UITextField!
    @IBOutlet weak var dateTxtField: UITextField!
    @IBOutlet weak var transferRecipientTxtField: UITextField!
    
    @IBOutlet weak var depositButton: UIButton!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    
    @IBOutlet weak var validadeButton: UIButton!
    
    @IBOutlet weak var transactionRecipient: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Layouts
        outView.layer.cornerRadius = 8
        outView.layer.borderWidth = 1.5
        outView.layer.borderColor = UIColor.darkGray.cgColor
        
        depositButton.layer.cornerRadius = 12
        purchaseButton.layer.cornerRadius = 12
        transferButton.layer.cornerRadius = 12
        
        descriptionTxtView.layer.cornerRadius = 8
        descriptionTxtView.layer.borderWidth = 1.5
        descriptionTxtView.layer.borderColor = UIColor.blue.cgColor
        
        cashValueTxtField.layer.borderWidth = 1.5
        cashValueTxtField.layer.borderColor = UIColor.blue.cgColor
        dateTxtField.layer.borderWidth = 1.5
        dateTxtField.layer.borderColor = UIColor.blue.cgColor
        transferRecipientTxtField.layer.borderWidth = 1.5
        transferRecipientTxtField.layer.borderColor = UIColor.blue.cgColor
        
        validadeButton.layer.cornerRadius = 8
        
        transactionRecipient.isHidden = true
        
    }
    
//MARK: - Buttons
    
    @IBAction func transactionButtonPressed(_ sender: UIButton) {
        
        //Buttons implementation
        depositButton.isSelected = false
        purchaseButton.isSelected = false
        transferButton.isSelected = false
        sender.isSelected = true
        
        depositButton.backgroundColor = .lightGray
        purchaseButton.backgroundColor = .lightGray
        transferButton.backgroundColor = .lightGray
        sender.backgroundColor = .blue
        
        if transferButton.isSelected == true {
            transactionRecipient.isHidden = false
        } else {
            transactionRecipient.isHidden = true
        }
    }
    
    @IBAction func validateButtonPressed(_ sender: UIButton) {
        
        //MARK: - POST Deposit Data
        if depositButton.isSelected == true {
            
            let params: [String: Any?] = [
                "description": descriptionTxtView.text,
                "cash_value": cashValueTxtField.text,
                "date": dateTxtField.text,
                "cliente": "98765432100"
            ]
            
            //POST Deposit Data
            guard let url = URL(string: "https://fipaydebonaire.herokuapp.com/deposito/") else { return
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            
            let session = URLSession.shared.dataTask(with: request) { data, response, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                    print(jsonRes ?? nil)
                }
            }.resume()
            
            performSegue(withIdentifier: "TransactionToCurrency", sender: self)
        }
        
        //MARK: - POST Purchase Data
        if purchaseButton.isSelected == true {
            
            
            let params: [String: Any?] = [
                "description": descriptionTxtView.text,
                "cash_value": cashValueTxtField.text,
                "date": dateTxtField.text,
                "cliente": "98765432100"
            ]
            
            //POST Purchase Data
            guard let url = URL(string: "https://fipaydebonaire.herokuapp.com/compras-feitas/") else { return
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            
            let session = URLSession.shared.dataTask(with: request) { data, response, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                    print(jsonRes ?? nil)
                }
            }.resume()
            
            performSegue(withIdentifier: "TransactionToCard", sender: self)
        }
        
        //MARK: - POST Transfer Data
        if transferButton.isSelected == true {
            
            
            let params: [String: Any?] = [
                "description": descriptionTxtView.text,
                "cash_value": cashValueTxtField.text,
                "date": dateTxtField.text,
                "destinatario": transferRecipientTxtField.text
            ]
            
            //POST Transfer Data
            guard let url = URL(string: "https://fipaydebonaire.herokuapp.com/transferencia/") else { return
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            
            let session = URLSession.shared.dataTask(with: request) { data, response, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                    print(jsonRes ?? nil)
                }
            }.resume()
            
            performSegue(withIdentifier: "TransactionToNotification", sender: self)
        }
        
        
    }
    
    
}
