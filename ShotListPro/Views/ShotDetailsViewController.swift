//
//  ShotDetailsViewController.swift
//  ShotListPro
//
//  Created by Jared on 10/20/20.
//

import Foundation
import UIKit



extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

class ShotDetailsViewController :  UITableViewController {
    
    
    var shot = Shot(shotTitle: "", shotIsComplete: false, shotNotes: "", cameraForShot: "", lensForShot: "", shotLength: "", shotMood: "", numOfShots: "", shotSection: "", shotID: "")
    var elements : Mirror?
    var array = [Int : [String : Any]]()
    
    
    @objc func editProject(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ShotViewController.editProject))
        self.tableView.separatorColor = UIColor.clear
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.tableView.showsVerticalScrollIndicator = false
        
        elements = Mirror(reflecting: shot)
        if elements != nil {
            for (index, element) in elements!.children.enumerated() {
                if let propertyName = element.label as String? {
                    
                    let readableValue = propertyName.first(where: {$0.isUppercase == true})
                    let splitNames = propertyName.split(separator: Character(extendedGraphemeClusterLiteral: readableValue!))
                    let firstName = splitNames.first?.lowercased().capitalizingFirstLetter() ?? ""
                    let secondName = "\(readableValue!)\(splitNames.last ?? "")".lowercased().capitalizingFirstLetter()
                    let name = String(firstName + " " + secondName)
                    array[index] = [name : element.value]
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return TextFieldCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}