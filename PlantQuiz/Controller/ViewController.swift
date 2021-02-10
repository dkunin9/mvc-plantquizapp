//
//  ViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var plantImage: UIImageView!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        buttonA.backgroundColor = .clear
        buttonB.backgroundColor = .clear
        
        
        // get data from Model
        questionLabel.text = quizBrain.getQuestion()
        plantImage.image = UIImage(named: quizBrain.getImageName())
        progressBar.progress = quizBrain.getProgress()
    }

}

