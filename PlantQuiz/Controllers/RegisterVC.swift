//
//  RegisterViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 19.02.2021.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterVC: UIViewController {

    // MARK: - Weak variables
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    print(e)
                }
                else {
                    self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                }
            }
            
        }
    }
    
    
    func updateUI() {
        registerButton.layer.cornerRadius = 10
        registerButton.titleLabel!.font = UIFont(name: Constants.Fonts.righteous, size: 40)
    }
    
}
