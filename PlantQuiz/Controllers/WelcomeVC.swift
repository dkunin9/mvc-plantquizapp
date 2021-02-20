//
//  WelcomeViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 19.02.2021.
//

import UIKit
import CLTypingLabel

class WelcomeVC: UIViewController {

    // MARK: - Weak variables
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
        updateUI()
    }
    
    func updateUI() {
        titleLabel.text = ""
        let title = Constants.appName
        titleLabel.text = title
    }

}
