//
//  EditShotViewController.swift
//  ShotListPro
//
//  Created by Jared on 11/2/20.
//
import Firebase
import Foundation
import UIKit

class EditShotViewController :  UITableViewController, TextFieldCellDelegate {
    
    func valueDidChange(key: String, value: Any) {
        Firestore.firestore().collection("projects").document(self.shot.projectId).collection("shots").document(self.shot.shotID).setData([key : value], merge: true)
    }
    
    var shot : Shot
    var shotDict = [String : Any]()
    var elements : Mirror?
    var array = [Int : [String : Any]]()
    var currentProject : Project?
    
    init(shot : Shot) {
        self.shot = shot
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Alert Handling
    func showAlert(error : String) {
        let alert = UIAlertController(title: "Ooops", message: error, preferredStyle: .alert)
        alert.addAction(.init(title: "Dismiss", style: .cancel, handler: {_ in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func createShot(sender: UIBarButtonItem) {
        if shotDict["shotTitle"] as? String != "" {
            ShotController.sharedInstance.createShot(shotDict: shotDict)
            self.dismiss(animated: true, completion: nil)
        } else {
            self.showAlert(error: "Please enter a title.")
        }
    }
    
    @objc func cancelShot(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(TextFieldCell.self, forCellReuseIdentifier: "TextFieldCell")
        self.tableView.allowsSelection = false
        self.view.backgroundColor = UIColor.white
        self.tableView.separatorColor = UIColor.clear
        self.tableView.allowsSelection = false
        self.title = "Edit"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.tableView.showsVerticalScrollIndicator = false
        
        
        print(shot)
        elements = Mirror(reflecting: shot)
        print(elements)
        shotDict["projectId"] = currentProject?.projectID
        if elements != nil {
            for (index, element) in elements!.children.enumerated() {
                if index < (elements?.children.count ?? 0) - shot.numberOfVariablesToIgnore {
                    if let propertyName = element.label as String? {
                        let readableValue = propertyName.first(where: {$0.isUppercase == true})
                        let splitNames = propertyName.split(separator: Character(extendedGraphemeClusterLiteral: readableValue!))
                        let firstName = splitNames.first?.lowercased().capitalizingFirstLetter() ?? ""
                        let secondName = "\(readableValue!)\(splitNames.last ?? "")".lowercased().capitalizingFirstLetter()
                        let name = String(firstName + " " + secondName)
                        print(name)
                        array[index] = [name : element.value]
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCellType = array[indexPath.row]?.first?.key
        let key = String(currentCellType?.split(separator: " ").first ?? "").lowercased() + String(currentCellType?.split(separator: " ").last ?? "")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell
        else {
            fatalError("The registered type for the cell does not match the casting")
        }
        cell.key = key
        cell.title = array[indexPath.row]?.first?.key ?? ""
        cell.result = array[indexPath.row]?.first?.value ?? ""
        cell.delegate = self
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
