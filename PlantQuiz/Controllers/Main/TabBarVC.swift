//
//  TabBarVC.swift
//  PlantQuiz
//
//  Created by Daniel on 04.03.2021.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = true
    }
}
