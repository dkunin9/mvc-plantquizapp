//
//  QuizBrain.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import Foundation

struct QuizBrain {
    
    var allQuestions = AllQuestions()
    var questionNumber = 0
    var correctQuestions = 0.0
    var quizActive = false
    var quizResult = ""
    
    func getQuestions() -> [String] {
        return [allQuestions.questions[questionNumber].qa, allQuestions.questions[questionNumber].qb, allQuestions.questions[questionNumber].qc, allQuestions.questions[questionNumber].qd]
    }
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(allQuestions.questions.count)
    }
    func getImageName() -> String {
        return allQuestions.questions[questionNumber].image
    }
    func getScore() -> Double {
        return correctQuestions
    }
    func getState() -> Bool {
        return quizActive
    }
    func getResult() -> String {
        return quizResult
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == allQuestions.questions[questionNumber].answer {
            correctQuestions += 1.0
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion () {
        // Next question
        if (questionNumber + 1 != allQuestions.questions.count) {
            questionNumber += 1
        }
        
        // Last question answered
        if (questionNumber + 1 == allQuestions.questions.count) {
            finish()
        }
    }
    
    mutating func finish() {
        if (correctQuestions < 0.3 * Double(allQuestions.questions.count)) {
            quizResult = "wrench man"
        }
        if (correctQuestions >= 0.3 * Double(allQuestions.questions.count) && correctQuestions < 0.7 * Double(allQuestions.questions.count)) {
            quizResult = "garden lover"
        }
        if (correctQuestions >= 0.7 * Double(allQuestions.questions.count)) {
            quizResult = "landscape architect"
        }
        quizActive = false
    }
    
    mutating func restart () {
        allQuestions = AllQuestions()
        quizActive = true
        questionNumber = 0
        correctQuestions = 0.0
    }
}
