//
//  QuizBrain.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(text: "Is it a Cladina Arbuscula?", answer: "True", image: "arbuscula"),
        Question(text: "Is it a Cladina stellaris?", answer: "False", image: "stellaris"),
        Question(text: "Is it a Cladina rangiferia?", answer: "True", image: "rangiferia"),
        Question(text: "Is it a Peltigera canina?", answer: "True", image: "canina"),
    ]
    var questionNumber = 0
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            return true
        } else {
            return false
        }
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].text
    }
    
    func getImageName() -> String {
        return quiz[questionNumber].image
    }
    
    mutating func nextQuestion () {
        if (questionNumber + 1==quiz.count) {
            questionNumber = 0
        }
        else {
            questionNumber += 1
        }
    }
}
