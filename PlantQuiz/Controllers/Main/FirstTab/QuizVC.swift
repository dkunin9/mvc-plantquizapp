//
//  ViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 10.02.2021.
//

import UIKit
import SwiftyButton
import Firebase
import FirebaseFirestore
import FirebaseAuth
import ViewAnimator


protocol RefreshQuizProtocol {
    func needsToRefresh()
}


class QuizVC: UIViewController {

    // MARK: - Weak variables

    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var buttonA: PressableButton!
    @IBOutlet weak var buttonB: PressableButton!
    @IBOutlet weak var buttonC: PressableButton!
    @IBOutlet weak var buttonD: PressableButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    let db = Firestore.firestore()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizBrain.restart()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: PressableButton) {
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.colors = .init(button: .green, shadow: .green)
        } else {
            sender.colors = .init(button: .red, shadow: .red)
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        quizBrain.restart()
        updateUI()
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print(signOutError.localizedDescription)
        }
        
    }
    
    @objc func updateUI() {
        
        // set navigation
        navigationItem.hidesBackButton = true
        title = Constants.appName
        
        let zoomAnimation = AnimationType.zoom(scale: 2)
        let horizontalAnimation = AnimationType.vector(CGVector(dx: 20, dy: 0))
        UIView.animate(views: [plantImage, buttonA, buttonB, buttonC, buttonD],
                       animations: [horizontalAnimation],
                       options: [.curveEaseInOut],
                       completion: nil)

        
        
        // prepare SwiftyButtons ;)
        buttonA.colors = .init(button: UIColor(named: "ButtonColor")!, shadow: .black)
        buttonA.disabledColors = .init(button: .gray, shadow: .darkGray)
        buttonA.setTitle(quizBrain.getQuestions()[0], for: .normal)
        buttonB.colors = .init(button: UIColor(named: "ButtonColor")!, shadow: .black)
        buttonB.disabledColors = .init(button: .gray, shadow: .darkGray)
        buttonB.setTitle(quizBrain.getQuestions()[1], for: .normal)
        buttonC.colors = .init(button: UIColor(named: "ButtonColor")!, shadow: .black)
        buttonC.disabledColors = .init(button: .gray, shadow: .darkGray)
        buttonC.setTitle(quizBrain.getQuestions()[2], for: .normal)
        buttonD.colors = .init(button: UIColor(named: "ButtonColor")!, shadow: .black)
        buttonD.disabledColors = .init(button: .gray, shadow: .darkGray)
        buttonD.setTitle(quizBrain.getQuestions()[3], for: .normal)

        plantImage.layer.borderWidth = 1
        
        // Show data from Model
        plantImage.image = UIImage(named: quizBrain.getImageName())
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        
        
        if (scoreLabel.text != String(quizBrain.getScore())) {
            UIView.animate(views: [scoreLabel],
                           animations: [zoomAnimation],
                           options: [.curveEaseInOut],
                           completion: nil)
        }
        
        scoreLabel.text = String(quizBrain.getScore())
        
        // Push ResultVC
        if !quizBrain.getState() {
            let score = String(quizBrain.getScore())
            let result = quizBrain.getResult()
            if let resultSender = Auth.auth().currentUser?.email
            {
                let resultData = [
                    Constants.FStore.senderField: resultSender,
                    Constants.FStore.scoreField: score,
                    Constants.FStore.resultField: result,
                    Constants.FStore.dateField: Date().timeIntervalSince1970
                ] as [String : Any]
                db.collection(Constants.FStore.collectionName).addDocument(data: resultData) { (error) in
                    if let e = error {
                        print("Issue in saving to firestore: \(e.localizedDescription)")
                    } else {
                        print("Successfully saved")
                    }
                }
            }
            self.performSegue(withIdentifier: Constants.quizSegue, sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.quizSegue {
            let destinationVC = segue.destination as! ResultVC
            destinationVC.quizBrain = quizBrain
            destinationVC.delegate = self
        }
    }

}


extension QuizVC: RefreshQuizProtocol {
    func needsToRefresh() {
        quizBrain.restart()
        updateUI()
    }
}

