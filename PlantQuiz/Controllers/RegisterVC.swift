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

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
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
    
}
