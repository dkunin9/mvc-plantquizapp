//
//  ViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import UIKit
import SwiftyButton

class QuizViewController: UIViewController {

    // MARK: - Weak variables

    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var buttonA: PressableButton!
    @IBOutlet weak var buttonB: PressableButton!
    @IBOutlet weak var buttonC: PressableButton!
    @IBOutlet weak var buttonD: PressableButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizBrain.restart()
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
        // prepare SwiftyButtons ;)
        buttonA.colors = .init(button: UIColor(named: "ButtonColor")!, shadow: .black)
        buttonA.disabledColors = .init(button: .gray, shadow: .darkGray)
        buttonA.setTitle(quizBrain.getQuestions()[0], for: .normal)
        buttonB.colors = .init(button: UIColor(named: "ButtonColor")!, shadow: .black)
        buttonB.disabledColors = .init(button: .gray, shadow: .darkGray)
        buttonB.setTitle(quizBrain.getQuestions()[1], for: .normal)
        buttonC.colors = .init(button: UIColor(named: "ButtonColor")!, shadow: .black)
        buttonC.disabledColors = .init(button: .gray, shadow: .darkGray)
        buttonC.setTitle(quizBrain.getQuestions()[2], for: .normal)
        buttonD.colors = .init(button: UIColor(named: "ButtonColor")!, shadow: .black)
        buttonD.disabledColors = .init(button: .gray, shadow: .darkGray)
        buttonD.setTitle(quizBrain.getQuestions()[3], for: .normal)

        plantImage.layer.borderWidth = 1
        
        // Show data from Model
        plantImage.image = UIImage(named: quizBrain.getImageName())
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = String(quizBrain.getScore())
        
        // Change VC
        if !quizBrain.getState() {
            self.performSegue(withIdentifier: "openResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.quizBrain = quizBrain
        }
    }

}

