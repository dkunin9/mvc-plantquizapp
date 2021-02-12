//
//  Quiz.swift
//  PlantQuiz
//
//  Created by Daniel on 12.02.2021.
//

import Foundation

struct AllQuestions {
    
    var questions : [ Question ]
    
    init() {
        self.questions = [
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
        questions.shuffle()
    }
}
