//
//  ResultsViewController.swift
//  PlantQuiz
//
//  Created by Daniel on 11.02.2021.
//

import UIKit
import SwiftyButton
import FirebaseAuth
import FirebaseFirestore


class ResultVC: UIViewController {
    
    // MARK: - Weak variables
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var replayButton: PressableButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var quizBrain: QuizBrain!
    
    var records : [String] = []
    
    let db = Firestore.firestore()
    
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
        loadResults()
    }
    
    func loadResults() {
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.scoreField)
            .getDocuments { (querySnapshot, error) in
            self.records = []
            if let e = error {
                print("Issue in loading from firestore: \(e.localizedDescription)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let sender = data[Constants.FStore.senderField] as? String,
                           let result = data[Constants.FStore.resultField] as? String,
                           let score = data[Constants.FStore.scoreField] as? String {
                            self.records.append("\(score)" + " " + "\(result)")
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                        print(doc.data())
                    }
                }
            }
        }
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
