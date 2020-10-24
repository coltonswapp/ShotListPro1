//
//  ViewController.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/19/20.
//

import UIKit

class ViewController: UITableViewController {

    @objc func addProject(sender: UIBarButtonItem) {
        print("Hello")
        self.present(UINavigationController(rootViewController:AddProjectViewController()), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Projects"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.tableView.showsVerticalScrollIndicator = false
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 210
        self.tableView.register(ProjectCell.self, forCellReuseIdentifier: "ProjectCell")
        
        //Bar Button
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill", withConfiguration: configuration), style: .plain, target: self, action: #selector(ViewController.addProject))
        
        self.tableView.separatorColor = UIColor.clear
        ProjectController.sharedInstance.fetchAllProjects(completion: {
            completed in
            if completed {
                self.tableView.reloadData()
            }
        })
        
        //ProjectController.sharedInstance.createProject(projectTitle: "sdfasdfasdfasdfa")
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectController.sharedInstance.projects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as? ProjectCell
        else {
            fatalError("Hello")
        }
        let currentInfo = ProjectController.sharedInstance.projects[indexPath.row]
        cell.updateConstraints()
        cell.projectTitle = currentInfo.projectTitle
        cell.company = currentInfo.clientName
        cell.date = currentInfo.projectDeadline.toString()
        cell.numberOfShots = "0"
        cell.percentage = "45%"
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(ShotViewController(), animated: true)
    }

}


class CustomLabel : UILabel {
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        
        var rectToReturn = rect.inset(by: insets)
        rectToReturn.size.width += 40
        super.drawText(in: rectToReturn)
    }
    
}
extension Date {

    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
