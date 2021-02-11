//
//  ViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Weak variables

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // Correct / Wrong answer color manage
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        // Set color back to default
        buttonA.backgroundColor = .clear
        buttonB.backgroundColor = .clear
        buttonC.backgroundColor = .clear
        buttonD.backgroundColor = .clear
        buttonA.setTitle(quizBrain.getQuestion()[0], for: .normal)
        buttonB.setTitle(quizBrain.getQuestion()[1], for: .normal)
        buttonC.setTitle(quizBrain.getQuestion()[2], for: .normal)
        buttonD.setTitle(quizBrain.getQuestion()[3], for: .normal)
        
        /*
         get data from Model
         */
        plantImage.image = UIImage(named: quizBrain.getImageName())
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = String(quizBrain.getScore())
    }

}

