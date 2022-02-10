
import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
//MARK: - Outlets
    
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.layer.cornerRadius = 8
        rememberMeButton.layer.cornerRadius = 3
        rememberMeButton.layer.borderWidth = 1.5
        rememberMeButton.layer.borderColor = UIColor.blue.cgColor
    }
    
//MARK: - Buttons
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        //Login func
        if let email = emailTxtField.text, let password = passTxtField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
                
            }
        }
    }
    
}
