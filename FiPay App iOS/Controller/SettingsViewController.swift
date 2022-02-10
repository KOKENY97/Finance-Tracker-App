

import Foundation
import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
//MARK: - Buttons
    
    @IBAction func accountButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func notificationButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func myCardButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func securityButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func currencyButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func servicesButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func statisticsButtonPressed(_ sender: UIButton) {
    }
    
    //Logout func
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    
    
    
    
    
    
    
    
    
}
