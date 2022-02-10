

import Foundation
import UIKit
import FirebaseAuth

class AccountViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passLbl: UILabel!
    @IBOutlet weak var cpfLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var streetLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAccount()
        
    }
    
    //MARK: - URLSession - GET
    func getAccount() {
        guard let url = URL(string: "https://fipaydebonaire.herokuapp.com/cadastro_clientes/98765432100") else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                guard let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: String] else { return }
                DispatchQueue.main.async {
                    self.nameLbl.text = jsonRes["nome"]
                    self.emailLbl.text = jsonRes["email"]
                    self.passLbl.text = jsonRes["password"]
                    self.cpfLbl.text = jsonRes["cpf"]
                    self.countryLbl.text = jsonRes["country"]
                    self.stateLbl.text = jsonRes["state"]
                    self.cityLbl.text = jsonRes["city"]
                    self.streetLbl.text = jsonRes["street"]
                }
                
                
            }
            
            
        }.resume()
    }
    

    
}
