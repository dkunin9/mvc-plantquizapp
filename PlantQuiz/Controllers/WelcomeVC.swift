//
//  WelcomeViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 19.02.2021.
//

import UIKit
import CLTypingLabel

class WelcomeVC: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTitle()
    }
    
    func animateTitle() {
        titleLabel.text = ""
        let title = Constants.appName
        titleLabel.text = title
    }

}
