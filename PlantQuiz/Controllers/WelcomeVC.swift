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
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        let attributes = [NSAttributedString.Key.font: UIFont(name: Constants.Fonts.righteous, size: 30)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
        updateUI()
    }
    
    func updateUI() {
        titleLabel.text = ""
        titleLabel.font = UIFont(name: Constants.Fonts.pacifico, size: 70)
        registerButton.titleLabel!.font = UIFont(name: Constants.Fonts.righteous, size: 40)
        loginButton.titleLabel!.font = UIFont(name: Constants.Fonts.righteous, size: 40)
        let title = Constants.appName
        titleLabel.text = title
    }

}
