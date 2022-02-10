

import Foundation
import Firebase
import UIKit

class UpdatedPassword: UIViewController {
    
//MARK: - Outlets
    
    @IBOutlet weak var passTxtField: UITextField!
    
//MARK: - Buttons
    
    @IBAction func updatedPassButtonPressed(_ sender: UIButton) {
        
        let auth = Auth.auth()
        
        //Password reset email
        auth.sendPasswordReset(withEmail: passTxtField.text!) { error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                print("Password reset email has been sent")
            }
        }
       
        
        
    }
    
    
}
