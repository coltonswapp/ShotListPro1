//
//  ProjectCell.swift
//  ShotListPro
//
//  Created by Jared on 10/20/20.
//

import Foundation
import UIKit

class ProjectCell : UITableViewCell {
    
    var projectTitle : String = ""
    var company : String = ""
    var date : String = ""
    var percentage : String = ""
    var numberOfShots : String = ""
    
    
    var background : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grey")
        view.layer.cornerRadius = 10
        return view
    }()
    
    var projectTitleLbl : UILabel = {
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

    override func updateConstraints() {
        super.updateConstraints()
        self.setupConstraints()
    }
    
    
    func setupConstraints() {
        //Setup Background
        
        projectTitleLbl.text = projectTitle
        companyLbl.text = company
        dateLbl.text = date
        percentageLbl.text = percentage
        numberOfShotsLbl.text = numberOfShots
        
        self.contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true

        //Setup Title
        self.background.addSubview(projectTitleLbl)
        projectTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        projectTitleLbl.leadingAnchor.constraint(equalTo: self.background.leadingAnchor, constant: 10).isActive = true
        projectTitleLbl.topAnchor.constraint(equalTo: self.background.topAnchor, constant: 10).isActive = true
        projectTitleLbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Setup Company Label
        self.background.addSubview(companyLbl)
        companyLbl.translatesAutoresizingMaskIntoConstraints = false
        companyLbl.leadingAnchor.constraint(equalTo: self.background.leadingAnchor, constant: 10).isActive = true
        companyLbl.topAnchor.constraint(equalTo: self.projectTitleLbl.bottomAnchor, constant: 10).isActive = true
        companyLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Setup Date Label
        self.background.addSubview(dateLbl)
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        dateLbl.leadingAnchor.constraint(equalTo: self.background.leadingAnchor, constant: 10).isActive = true
        dateLbl.topAnchor.constraint(equalTo: self.companyLbl.bottomAnchor, constant: 10).isActive = true
        dateLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Setup Percentage Label
        self.background.addSubview(percentageLbl)
        percentageLbl.translatesAutoresizingMaskIntoConstraints = false
        percentageLbl.leadingAnchor.constraint(equalTo: self.background.leadingAnchor, constant: 10).isActive = true
        percentageLbl.topAnchor.constraint(equalTo: self.dateLbl.bottomAnchor, constant: 10).isActive = true
        percentageLbl.bottomAnchor.constraint(equalTo: self.background.bottomAnchor, constant: -10).isActive = true
        percentageLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Setup Number of Shots Label
        self.background.addSubview(numberOfShotsLbl)
        numberOfShotsLbl.translatesAutoresizingMaskIntoConstraints = false
        numberOfShotsLbl.topAnchor.constraint(equalTo: self.dateLbl.bottomAnchor, constant: 10).isActive = true
        numberOfShotsLbl.trailingAnchor.constraint(equalTo: self.background.trailingAnchor, constant: -10).isActive = true
        numberOfShotsLbl.bottomAnchor.constraint(equalTo: self.background.bottomAnchor, constant : -10).isActive = true
        numberOfShotsLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
