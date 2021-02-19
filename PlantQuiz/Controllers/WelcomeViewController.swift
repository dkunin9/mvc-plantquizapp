//
//  WelcomeViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 19.02.2021.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTitle()
        // Do any additional setup after loading the view.
    }
    
    func animateTitle() {
        titleLabel.text = ""
//        var chardIndex = 0.0
        let title = "☘️ Plantly"
        titleLabel.text = title
//        for letter in title {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * chardIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            chardIndex+=1
//        }
    }

}
