//
//  TextFieldCell.swift
//  ShotListPro
//
//  Created by Jared on 10/20/20.
//

import Foundation
import UIKit

class TextFieldCell : UITableViewCell, UITextFieldDelegate {

    var titleLbl : UILabel = {
        var label = UILabel()
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var contentTextField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter Something Here..."
        textField.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return textField
    }()
    
    var divider : UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(named: "grey")
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
    }
    
    func setupConstraints() {
        self.addSubview(titleLbl)
        self.addSubview(divider)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        titleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: self.divider.leftAnchor, constant: 10).isActive = true
        titleLbl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        divider.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(contentTextField)
        contentTextField.translatesAutoresizingMaskIntoConstraints = false
        contentTextField.leftAnchor.constraint(equalTo: self.divider.rightAnchor, constant: 10).isActive = true
        contentTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        contentTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
    }
    
}
