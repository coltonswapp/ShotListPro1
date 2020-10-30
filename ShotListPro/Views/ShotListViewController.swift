//
//  ShotListViewController.swift
//  ShotListPro
//
//  Created by Jared on 10/20/20.
//

import Foundation
import UIKit

class ShotViewController : UITableViewController {
    var currentProject : Project?
    @objc func addShot(sender: UIBarButtonItem) {
        let vc =  ShotDetailsViewController()
        vc.currentProject = currentProject
        self.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Shots"
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill", withConfiguration: configuration), style: .plain, target: self, action: #selector(ShotViewController.addShot(sender:)))

        self.tableView.register(ShotCell.self, forCellReuseIdentifier: "ShotCell")
        self.tableView.separatorColor = UIColor.clear
        self.tableView.allowsSelection = false
        self.tableView.reloadData()
        
        ShotController.sharedInstance.fetchShotsInProject(currentProject?.projectID ?? "", completion: {
            completed in
            self.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShotController.sharedInstance.shots[currentProject?.projectID ?? ""]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShotCell") as? ShotCell else { return UITableViewCell()}
        cell.projectId = currentProject?.projectID
        if ShotController.sharedInstance.shots[currentProject?.projectID ?? ""] != nil {
            cell.shot = ShotController.sharedInstance.shots[currentProject?.projectID ?? ""]![indexPath.row]
        }
        cell.updateConstraints()
        
        return cell
    }

}
