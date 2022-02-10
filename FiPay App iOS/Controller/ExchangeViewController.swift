

import Foundation
import UIKit

class ExchangeViewController: UIViewController {
    
//MARK: - Outlets
    
    @IBOutlet weak var outView: UIView!
    
    @IBOutlet weak var fromView: UIView!
    @IBOutlet weak var toView: UIView!
    @IBOutlet weak var toView2: UIView!
    
    @IBOutlet weak var addCurrencyView: UIButton!
    @IBOutlet weak var checkExchangeView: UIButton!
    
    @IBOutlet weak var fromCurrencyPicker: UIPickerView!
    @IBOutlet weak var fromValueLbl: UILabel!
    
    @IBOutlet weak var toCurrencyPicker: UIPickerView!
    @IBOutlet weak var toValueLbl: UILabel!
    
    @IBOutlet weak var toCurrencyPicker2: UIPickerView!
    @IBOutlet weak var toValueLbl2: UILabel!
    
   
    
//MARK: - Array
    
    let currencyArray = ["ARS", "AUD", "BRL", "BTC", "CAD", "CNY", "EUR", "GRP", "JPY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Layouts
        outView.layer.borderWidth = 1.5
        outView.layer.cornerRadius = 8
        outView.layer.borderColor = UIColor.blue.cgColor
        
        fromView.layer.borderWidth = 0.5
        fromView.layer.cornerRadius = 8
        fromView.layer.borderColor = UIColor.lightGray.cgColor
        
        toView.layer.borderWidth = 0.5
        toView.layer.cornerRadius = 8
        toView.layer.borderColor = UIColor.lightGray.cgColor
        
        toView2.layer.borderWidth = 0.5
        toView2.layer.cornerRadius = 8
        toView2.layer.borderColor = UIColor.lightGray.cgColor
        
        addCurrencyView.layer.borderWidth = 1.5
        addCurrencyView.layer.cornerRadius = 8
        addCurrencyView.layer.borderColor = UIColor.blue.cgColor
        
        checkExchangeView.layer.cornerRadius = 8
        
        fromCurrencyPicker.dataSource = self
        toCurrencyPicker.dataSource = self
        toCurrencyPicker2.dataSource = self
        
        fromCurrencyPicker.delegate = self
        toCurrencyPicker.delegate = self
        toCurrencyPicker2.delegate = self
        
    }
    
//MARK: - Buttons
    
    @IBAction func addCurrencyPressed(_ sender: UIButton) {
    }
    
    @IBAction func checkExchangePressed(_ sender: UIButton) {
    }
    
    
}


//MARK: - UIPickerViewDataSource & UIPickerViewDelegate

extension ExchangeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = currencyArray[row]
    }
    
}
