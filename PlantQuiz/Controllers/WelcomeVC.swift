//
//  WelcomeViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 19.02.2021.
//

import UIKit
import CLTypingLabel

class WelcomeVC: UIViewController, UINavigationControllerDelegate {

    // MARK: - Weak variables
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func updateUI() {
        registerButton.layer.cornerRadius = 10
        registerButton.titleLabel!.font = UIFont(name: Constants.Fonts.righteous, size: 40)
        loginButton.layer.cornerRadius = 10
        loginButton.titleLabel!.font = UIFont(name: Constants.Fonts.righteous, size: 40)
        
        titleLabel.text = ""
        titleLabel.font = UIFont(name: Constants.Fonts.pacifico, size: 70)
        let title = Constants.appName
        titleLabel.text = title
    }

}
