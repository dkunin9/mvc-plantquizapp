//
//  Question.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import Foundation

struct Question {
    let qa: String
    let qb: String
    let qc: String
    let qd: String
    let answer: String
    let image: String
    
    init(qa: String, qb: String, qc: String, qd: String, answer: String, image: String) {
        self.qa = qa
        self.qb = qb
        self.qc = qc
        self.qd = qd
        self.answer = answer
        self.image = image
    }
}
