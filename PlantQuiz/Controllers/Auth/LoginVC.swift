//
//  LoginViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 19.02.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import ViewAnimator


class LoginVC: UIViewController, UINavigationControllerDelegate {
    
    // MARK: - Weak variables
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
        animate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    print(e.localizedDescription)
                }
                else {
                    self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                }
            }
        }
    }
    
    // MARK: - UI methods
    
    func updateUI() {
        loginButton.layer.cornerRadius = 10
        loginButton.titleLabel!.font = UIFont(name: Constants.Fonts.righteous, size: 40)
    }
    
    func animate() {
        let fromAnimation = AnimationType.vector(CGVector(dx: 30, dy: 0))
        let fromAnimation2 = AnimationType.vector(CGVector(dx: 60, dy: 0))
        let zoomAnimation = AnimationType.zoom(scale: 2)
        UIView.animate(views: [loginButton], animations: [zoomAnimation, fromAnimation], options: [.curveEaseInOut], completion: nil)
        UIView.animate(views: [emailTextField, passwordTextField], animations: [fromAnimation2], options: [.curveEaseInOut], completion: nil)
    }
    
}

