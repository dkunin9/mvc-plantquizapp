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
    
    var timer = Timer()
    
    let quiz = [
        Question(text: "Is it a Cladina Arbuscula?", answer: "True", image: "arbuscula"),
        Question(text: "Is it a Cladina stellaris?", answer: "False", image: "stellaris"),
        Question(text: "Is it a Cladina rangiferia?", answer: "True", image: "rangiferia"),
        Question(text: "Is it a Peltigera canina?", answer: "True", image: "canina"),
    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let realAnswer = quiz[questionNumber].answer
        
        if (userAnswer==realAnswer) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
      
        if (questionNumber + 1==quiz.count) {
            questionNumber = 0
        }
        else {
            questionNumber += 1
        }
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        buttonA.backgroundColor = .clear
        buttonB.backgroundColor = .clear
        questionLabel.text = quiz[questionNumber].text
        plantImage.image = UIImage(named: quiz[questionNumber].image)
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }

}

