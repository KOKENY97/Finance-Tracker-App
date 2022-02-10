
import UIKit

class WelcomeViewController: UIViewController {
    
//MARK: - Outlets

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.layer.cornerRadius = 8
        registerButton.layer.cornerRadius = 8
        registerButton.layer.borderWidth = 1.5
        registerButton.layer.borderColor = UIColor.white.cgColor
        

    }
    
//MARK: - Buttons

    @IBAction func signInPressed(_ sender: UIButton) {
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
 
    }
    
}

