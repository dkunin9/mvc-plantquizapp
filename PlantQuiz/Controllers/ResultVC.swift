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
import ViewAnimator


class ResultVC: UIViewController {
    
    private let animations = [AnimationType.vector(CGVector(dx: 0, dy: 30))]
    
    // MARK: - Weak variables
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var replayButton: PressableButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var quizBrain: QuizBrain!
    
    var delegate: RefreshQuizProtocol?
    
    var records : [String] = []
    
    let db = Firestore.firestore()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        self.delegate?.needsToRefresh()
        resultLabel.isHidden = false
        UIView.animate(views: [resultLabel], animations: self.animations, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.delegate?.needsToRefresh()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
                                UIView.animate(views: self.tableView.visibleCells, animations: self.animations, completion: nil)
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
        if (records.count < 10) {
            return records.count
        }
        else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! RecordCell
        if indexPath.row == 0 {
            cell.recordLabel.text = "⭐️ \(records[indexPath.row])"
            cell.recordLabel.font = cell.recordLabel.font.withSize(21)
        } else {
            cell.recordLabel.text = records[indexPath.row]
        }
        return cell
    }
}
