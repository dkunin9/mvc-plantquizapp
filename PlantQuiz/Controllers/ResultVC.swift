//
//  ResultsViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 11.02.2021.
//

import UIKit
import SwiftyButton


let records = [
    "👑 8/10 Landscape Architect",
    "1/10 Wrench man",
]


class ResultVC: UIViewController {
    
    var quizBrain: QuizBrain!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var replayButton: PressableButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        quizBrain.restart()
        print("lmao")
    }

    @IBAction func replayButtonPressed(_ sender: PressableButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func updateUI() {
        scoreLabel.text = String(quizBrain.getScore())
        resultLabel.text = quizBrain.getResult()
        
    }

}

extension ResultVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! RecordCell
        cell.recordLabel.text = records[indexPath.row]
        return cell
    }
}
