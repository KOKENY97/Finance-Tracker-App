
import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var registerButtonPressed: UIButton!
    
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var cpfTxtField: UITextField!
    @IBOutlet weak var countrytxtField: UITextField!
    @IBOutlet weak var statextField: UITextField!
    @IBOutlet weak var cityTxtField: UITextField!
    @IBOutlet weak var streetTxtField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Round register button
        registerButtonPressed.layer.cornerRadius = 8
        
        
        
    
        
    }
    
    //MARK: - Buttons
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        //Register func
        if let email = emailTxtField.text, let password = passTxtField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "RegisterToHome", sender: self)
                }
                
            }
        }
        
        //MARK: - POST Register Data
        let params: [String: Any?] = [
            "cpf": cpfTxtField.text,
            "nome": nameTxtField.text,
            "email": emailTxtField.text,
            "password": passTxtField.text,
            "country": countrytxtField.text,
            "state": statextField.text,
            "city": cityTxtField.text,
            "street": streetTxtField.text
        ]
        
        //POST Register Data
        guard let url = URL(string: "https://fipaydebonaire.herokuapp.com/cadastro_clientes/") else { return
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
        
        
        
    }
    
    
    
}
