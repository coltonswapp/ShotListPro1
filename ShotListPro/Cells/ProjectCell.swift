//
//  ProjectCell.swift
//  ShotListPro
//
//  Created by Jared on 10/20/20.
//

import Foundation
import UIKit

class ProjectCell : UITableViewCell {
    
    var background : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grey")
        view.layer.cornerRadius = 10
        return view
    }()
    
    var projectTitle : UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var companyLbl : CustomLabel = {
        let label = CustomLabel()
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.text = "Something"
        label.backgroundColor = UIColor(named: "red")
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    var dateLbl : CustomLabel = {
        let label = CustomLabel()
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.text = "Something"
        label.backgroundColor = UIColor(named: "orange")
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    var percentageLbl : CustomLabel = {
        let label = CustomLabel()
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.text = "50%"
        label.backgroundColor = UIColor(named: "purple")
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    var numberOfShotsLbl : CustomLabel = {
        let label = CustomLabel()
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.text = "14"
        label.backgroundColor = UIColor(named: "blue")
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
    }
    
    func setupConstraints() {
        //Setup Background
        self.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        background.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        background.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true

        //Setup Title
        self.addSubview(projectTitle)
        projectTitle.translatesAutoresizingMaskIntoConstraints = false
        projectTitle.leftAnchor.constraint(equalTo: self.background.leftAnchor, constant: 10).isActive = true
        projectTitle.topAnchor.constraint(equalTo: self.background.topAnchor, constant: 10).isActive = true
        projectTitle.rightAnchor.constraint(equalTo: self.background.rightAnchor, constant: 10).isActive = true
        projectTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Setup Company Label
        self.addSubview(companyLbl)
        companyLbl.translatesAutoresizingMaskIntoConstraints = false
        companyLbl.leftAnchor.constraint(equalTo: self.background.leftAnchor, constant: 10).isActive = true
        companyLbl.topAnchor.constraint(equalTo: self.projectTitle.bottomAnchor, constant: 10).isActive = true
        companyLbl.rightAnchor.constraint(equalTo: self.background.rightAnchor, constant: -10).isActive = true
        companyLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Setup Date Label
        self.addSubview(dateLbl)
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        dateLbl.leftAnchor.constraint(equalTo: self.background.leftAnchor, constant: 10).isActive = true
        dateLbl.topAnchor.constraint(equalTo: self.companyLbl.bottomAnchor, constant: 10).isActive = true
        dateLbl.rightAnchor.constraint(equalTo: self.background.rightAnchor, constant: -10).isActive = true
        dateLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Setup Percentage Label
        self.addSubview(percentageLbl)
        percentageLbl.translatesAutoresizingMaskIntoConstraints = false
        percentageLbl.leftAnchor.constraint(equalTo: self.background.leftAnchor, constant: 10).isActive = true
        percentageLbl.topAnchor.constraint(equalTo: self.dateLbl.bottomAnchor, constant: 10).isActive = true
        percentageLbl.bottomAnchor.constraint(equalTo: self.background.bottomAnchor, constant: -10).isActive = true
        percentageLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        percentageLbl.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        //Setup Number of Shots Label
        self.addSubview(numberOfShotsLbl)
        numberOfShotsLbl.translatesAutoresizingMaskIntoConstraints = false
        numberOfShotsLbl.topAnchor.constraint(equalTo: self.dateLbl.bottomAnchor, constant: 10).isActive = true
        numberOfShotsLbl.rightAnchor.constraint(equalTo: self.background.rightAnchor, constant: -10).isActive = true
        numberOfShotsLbl.bottomAnchor.constraint(equalTo: self.background.bottomAnchor, constant: -10).isActive = true
        numberOfShotsLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        numberOfShotsLbl.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}
