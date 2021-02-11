//
//  ResultsViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 11.02.2021.
//

import UIKit
import SwiftyButton

class ResultViewController: UIViewController {
    
    var quizBrain: QuizBrain!

    @IBOutlet weak var replayButton: PressableButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var farmerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        quizBrain.restart()
        print("lmao")
    }

    @IBAction func replayButtonPressed(_ sender: PressableButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    func updateUI() {
        resultLabel.text = String(quizBrain.getScore())
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
