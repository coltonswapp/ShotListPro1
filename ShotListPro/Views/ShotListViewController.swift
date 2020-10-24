//
//  ShotListViewController.swift
//  ShotListPro
//
//  Created by Jared on 10/20/20.
//

import Foundation
import UIKit

class ShotViewController : UITableViewController {
    
    @objc func editProject(sender: UIBarButtonItem) {
        self.present(UINavigationController(rootViewController: ProjectDetailsViewController()), animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Shots"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Details", style: .plain, target: self, action: #selector(ShotViewController.editProject))

        self.tableView.register(ShotCell.self, forCellReuseIdentifier: "ShotCell")
        self.tableView.separatorColor = UIColor.clear
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShotCell") as? ShotCell else { return UITableViewCell()}
        
        cell.shot = Shot(shotTitle: "Shot", shotIsComplete: false, shotNotes: "", cameraForShot: "", lensForShot: "", shotLength: "", shotMood: "Slow", numOfShots: "", shotSection: "Intro", shotID: "")
        cell.updateConstraints()
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ShotDetailsViewController(), animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
