//
//  Constants.swift
//  PlantQuiz
//
//  Created by Daniel on 19.02.2021.
//

import Foundation


struct Constants{
    static let appName = "☘️ Plantly"
    
    static let registerSegue = "RegisterToQuiz"
    static let loginSegue = "LoginToQuiz"
    static let quizSegue = "QuizToResult"
    
    static let recordCellIdentifier = "recordCell"
    static let recordNibName = "RecordCell"
    static let leaderCellIdentifier = "leaderCell"
    static let leaderNibName = "LeaderCell"
    
    struct FStore {
        static let collectionName = "results"
        static let senderField = "sender"
        static let scoreField = "score"
        static let resultField = "result"
        static let dateField = "date"
    }
    
    struct Fonts {
        static let pacifico = "Pacifico-Regular"
        static let righteous = "Righteous-Regular"
    }
}
