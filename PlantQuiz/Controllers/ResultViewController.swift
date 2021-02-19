//
//  ResultsViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 11.02.2021.
//

import UIKit
import SwiftyButton

class ResultViewController: UIViewController {
    
    var quizBrain: QuizBrain!

    @IBOutlet weak var replayButton: PressableButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        quizBrain.restart()
        print("lmao")
    }

    @IBAction func replayButtonPressed(_ sender: PressableButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func updateUI() {
        scoreLabel.text = String(quizBrain.getScore())
        resultLabel.text = quizBrain.getResult()
    }

}
