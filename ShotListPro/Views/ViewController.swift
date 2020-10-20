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
        
        //Bar Button
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill", withConfiguration: configuration), style: .plain, target: self, action: #selector(ViewController.addProject))
        
        self.tableView.separatorColor = UIColor.clear
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ProjectCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
