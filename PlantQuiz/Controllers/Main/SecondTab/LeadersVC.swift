//
//  LeadersVC.swift
//  PlantQuiz
//
//  Created by Daniel on 04.03.2021.
//

import UIKit
import ViewAnimator
import FirebaseAuth
import FirebaseFirestore

class LeadersVC: UIViewController {
    
    // MARK: - Weak variables
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private let animationVertical = [AnimationType.vector(CGVector(dx: 0, dy: 30))]
    private let animationHorizontal = [AnimationType.vector(CGVector(dx: 30, dy: 0))]
    
    let db = Firestore.firestore()
    
    var leaders : [String] = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.leaderNibName, bundle: nil), forCellReuseIdentifier: Constants.leaderCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(views: [titleLabel], animations: self.animationVertical, completion: nil)
        UIView.animate(views: self.tableView.visibleCells, animations: self.animationHorizontal, completion: nil)
    }
    
    func updateUI() {
        loadResults()
    }
    
    func loadResults() {
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.scoreField)
            .getDocuments { (querySnapshot, error) in
            self.leaders = []
            if let e = error {
                print("Issue in loading from firestore: \(e.localizedDescription)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let sender = data[Constants.FStore.senderField] as? String,
                           let result = data[Constants.FStore.resultField] as? String,
                           let score = data[Constants.FStore.scoreField] as? String {
                            self.leaders.append("\(score)" + " " + "\(sender)")
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                UIView.animate(views: self.tableView.visibleCells, animations: self.animationHorizontal, completion: nil)
                            }
                        }
                        print(doc.data())
                    }
                }
            }
        }
    }
    
}

extension LeadersVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (leaders.count < 5) {
            return leaders.count
        }
        else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.leaderCellIdentifier, for: indexPath) as! LeaderCell
        if indexPath.row == 0 {
            cell.leaderLabel.text = "⭐️ \(leaders[indexPath.row])"
            cell.leaderLabel.font = UIFont(name: Constants.Fonts.righteous, size: 30)
        } else {
            cell.leaderLabel.text = leaders[indexPath.row]
            cell.leaderLabel.font = UIFont(name: Constants.Fonts.righteous, size: 20)
        }
        return cell
    }
}
