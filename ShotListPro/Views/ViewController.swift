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
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill", withConfiguration: configuration), style: .plain, target: self, action: #selector(ViewController.addProject))
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
        cell.projectTitle = currentInfo.projectTitle
        cell.company = currentInfo.clientName
        cell.date = currentInfo.projectDeadline.toString()
        cell.numberOfShots = String(currentInfo.projectShots)
        if let shots = ShotController.sharedInstance.shots[currentInfo.projectID] {
            if shots.filter({$0.shotIsComplete == true}).count > 0 {
                print(shots.filter({$0.shotIsComplete == true}).count, currentInfo.projectShots, (shots.filter({$0.shotIsComplete == true}).count / currentInfo.projectShots) * 100)
                print(round(Double(shots.filter({$0.shotIsComplete == true}).count * 100) / Double(currentInfo.projectShots * 100)))
                let percentageDone = round((Double(shots.filter({$0.shotIsComplete == true}).count * 100) / Double(currentInfo.projectShots * 100)) * 100).clean + "%"
                cell.percentage = percentageDone
            } else {
                let percentageDone = String("0%")
                cell.percentage = percentageDone
            }
        }
        cell.updateConstraints()
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ShotViewController()
        vc.currentProject = ProjectController.sharedInstance.projects[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


class CustomLabel : UILabel {
    var textInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                left: -textInsets.left,
                bottom: -textInsets.bottom,
                right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
}


extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
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
