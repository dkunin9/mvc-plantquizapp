//
//  QuizBrain.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(qa: "Apple", qb: "Brad Pitt", qc: "orbuscila", qd: "arbuscula", answer: "arbuscula", image: "arbuscula"),
        Question(qa: "Mickey Mouse", qb: "Brad Pitt", qc: "Joshua Dunn", qd: "stellaris", answer: "stellaris", image: "stellaris"),
        Question(qa: "Android", qb: "Brad Pitt", qc: "orbuscila", qd: "arbuscula", answer: "arbuscula", image: "arbuscula"),
        Question(qa: "arbuscula", qb: "rangiferia", qc: "orbuscila", qd: "arbuscula", answer: "rangiferia", image: "rangiferia"),
        Question(qa: "arbuscula", qb: "Brad Pitt", qc: "orbuscila", qd: "arbuscula", answer: "arbuscula", image: "arbuscula"),
        Question(qa: "Apple", qb: "Brad Pitt", qc: "arbuscula", qd: "arbuscula", answer: "arbuscula", image: "arbuscula"),
        Question(qa: "iOS", qb: "Brad Pitt", qc: "orbuscila", qd: "arbuscula", answer: "canina", image: "canina"),
        Question(qa: "Mickey Mouse", qb: "arbuscula", qc: "rangiferia", qd: "arbuscula", answer: "rangiferia", image: "rangiferia"),
        Question(qa: "Apple", qb: "Brad Pitt", qc: "orbuscila", qd: "arbuscula", answer: "arbuscula", image: "arbuscula"),
        Question(qa: "Apple", qb: "Brad Pitt", qc: "stellaris", qd: "arbuscula", answer: "stellaris", image: "stellaris"),
        Question(qa: "Apple", qb: "Brad Pitt", qc: "arbuscula", qd: "arbusculo", answer: "arbuscula", image: "arbuscula"),
        Question(qa: "Apple", qb: "Brad Pitt", qc: "orbuscila", qd: "arbuscula", answer: "canina", image: "canina"),
    ]
    var questionNumber = 0
    var correctQuestions = 0.0
    
    
    func getQuestion() -> [String] {
        return [quiz[questionNumber].qa, quiz[questionNumber].qb, quiz[questionNumber].qc, quiz[questionNumber].qd]
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    func getImageName() -> String {
        return quiz[questionNumber].image
    }
    func getScore() -> Double {
        return correctQuestions
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            correctQuestions += 1.0
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion () {
        if (questionNumber + 1==quiz.count) {
            questionNumber = 0
            correctQuestions = 0
        }
        else {
            questionNumber += 1
        }
    }
    
    mutating func restart () {
        correctQuestions = 0
        questionNumber = 0
    }
    
}
