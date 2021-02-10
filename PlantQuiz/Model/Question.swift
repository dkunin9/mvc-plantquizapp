//
//  Question.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    let image: String
    
    init(text: String, answer: String, image: String) {
        self.text=text
        self.answer=answer
        self.image=image
    }
}
