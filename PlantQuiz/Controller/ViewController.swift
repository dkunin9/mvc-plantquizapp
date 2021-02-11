//
//  ViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import UIKit
import SwiftyButton

class ViewController: UIViewController {

    // MARK: - Weak variables

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonA: PressableButton!
    @IBOutlet weak var buttonB: PressableButton!
    @IBOutlet weak var buttonC: PressableButton!
    @IBOutlet weak var buttonD: PressableButton!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: PressableButton) {
        // Correct or Wrong answer color manage
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.colors = .init(button: .green, shadow: .green)
        } else {
            sender.colors = .init(button: .red, shadow: .red)
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        quizBrain.restart()
        updateUI()
    }
    
    @objc func updateUI() {
        
        /*
         prepare SwiftyButtons ;)
         */
        buttonA.colors = .init(button: .cyan, shadow: .blue)
        buttonA.disabledColors = .init(button: .gray, shadow: .darkGray)
        
        buttonB.colors = .init(button: .cyan, shadow: .blue)
        buttonB.disabledColors = .init(button: .gray, shadow: .darkGray)
        
        buttonC.colors = .init(button: .cyan, shadow: .blue)
        buttonC.disabledColors = .init(button: .gray, shadow: .darkGray)
        
        buttonD.colors = .init(button: .cyan, shadow: .blue)
        buttonD.disabledColors = .init(button: .gray, shadow: .darkGray)
        
        buttonA.setTitle(quizBrain.getQuestion()[0], for: .normal)
        buttonB.setTitle(quizBrain.getQuestion()[1], for: .normal)
        buttonC.setTitle(quizBrain.getQuestion()[2], for: .normal)
        buttonD.setTitle(quizBrain.getQuestion()[3], for: .normal)
        
        plantImage.layer.borderWidth = 3
        
        /*
         get data from Model
         */
        plantImage.image = UIImage(named: quizBrain.getImageName())
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = String(quizBrain.getScore())
    }

}

