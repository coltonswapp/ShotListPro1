//
//  ShotCell.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/24/20.
//

import UIKit

class ShotCell: UITableViewCell {
    
    var shot : Shot = Shot(shotTitle: "", shotIsComplete: false, shotNotes: "", cameraForShot: "", lensForShot: "", shotLength: "", shotMood: "", numOfShots: "", shotSection: "", shotID: "")
    var themeColor = UIColor(named: "grey")
    
    
    
    var background: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grey")
        view.layer.cornerRadius = 10
        return view
    }()
    
    var  shotTitleLbl: CustomLabel = {
        let label = CustomLabel()
        label.text = "Hello"
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var shotNotesLbl: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var gearLbl: UILabel = {
        let label = UILabel()
        label.text = "Gear"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var moodLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Slow"
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var shotSectionLbl: UILabel = {
        let label = UILabel()
        label.text = "Intro"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var numOfShotsLbl: UILabel = {
        let label = UILabel()
        label.text = "4-5"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var shotLengthLbl: CustomLabel = {
        let label = CustomLabel()
        label.text = "4-5secs"
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var circle: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 15
        return view
    }()
    
    override func updateConstraints() {
        super.updateConstraints()
        self.setupConstraints()
    }
    
    func setupConstraints() {
        
        self.contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        
        
        self.background.addSubview(shotTitleLbl)
        shotTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        shotTitleLbl.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10).isActive = true
        shotTitleLbl.topAnchor.constraint(equalTo: background.topAnchor, constant: 10).isActive = true
        shotTitleLbl.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        self.background.addSubview(shotNotesLbl)
        shotNotesLbl.translatesAutoresizingMaskIntoConstraints = false
        shotNotesLbl.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10).isActive = true
        shotNotesLbl.topAnchor.constraint(equalTo: shotTitleLbl.bottomAnchor, constant: 10).isActive = true
        
        
        self.background.addSubview(gearLbl)
        gearLbl.translatesAutoresizingMaskIntoConstraints = false
        gearLbl.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10).isActive = true
        gearLbl.topAnchor.constraint(equalTo: shotNotesLbl.bottomAnchor, constant: 10).isActive = true
        
        self.background.addSubview(moodLabel)
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        moodLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10).isActive = true
        moodLabel.topAnchor.constraint(equalTo: gearLbl.bottomAnchor, constant: 10).isActive = true
        moodLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10).isActive = true
        
        self.background.addSubview(shotSectionLbl)
        shotSectionLbl.translatesAutoresizingMaskIntoConstraints = false
        shotSectionLbl.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10).isActive = true
        shotSectionLbl.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: 0).isActive = true
        
        self.background.addSubview(numOfShotsLbl)
        numOfShotsLbl.translatesAutoresizingMaskIntoConstraints = false
        numOfShotsLbl.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10).isActive = true
        numOfShotsLbl.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10).isActive = true
        
        self.background.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .green
        circle.centerYAnchor.constraint(equalTo: background.centerYAnchor, constant: 0).isActive = true
        circle.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.background.addSubview(shotLengthLbl)
        shotLengthLbl.translatesAutoresizingMaskIntoConstraints = false
        shotLengthLbl.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10).isActive = true
        shotLengthLbl.topAnchor.constraint(equalTo: background.topAnchor, constant: 10).isActive = true
        
    }
}
