//
//  TextFieldCell.swift
//  ShotListPro
//
//  Created by Jared on 10/20/20.
//

import Foundation
import UIKit

class TextFieldCell : UITableViewCell, UITextFieldDelegate {
    
    var delegate: TextFieldCellDelegate?
    var key : String = ""
    var title : String? = ""
    var result : Any = ""

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.result = textField.text ?? ""
    }
    
    var titleLbl : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    var contentTextField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter Something Here..."
        textField.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        return textField
    }()
    
    var datePicker : UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
        titleLbl.text = self.title
    }
    
    func setupConstraints() {
        
        contentTextField.delegate = self
        
        self.contentView.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        titleLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true

        if result is String {
            self.addSubview(contentTextField)
            result = contentTextField.text
            contentTextField.translatesAutoresizingMaskIntoConstraints = false
            contentTextField.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
            contentTextField.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
            contentTextField.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
            contentTextField.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
            contentTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        } else if result is Date {
            self.addSubview(datePicker)
            result = datePicker.date
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            datePicker.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
            datePicker.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
            datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            datePicker.heightAnchor.constraint(equalToConstant: 40).isActive = true
            datePicker.addTarget(self, action: #selector(self.datePickerChanged(picker:)), for: .valueChanged)
        }
    }

    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.valueDidChange(key: self.key, value: textField.text)
        print(textField.text)
    }

    @objc func datePickerChanged(picker: UIDatePicker) {
        self.delegate?.valueDidChange(key: self.key, value: picker.date)
    }
}


protocol TextFieldCellDelegate {
    func valueDidChange(key : String, value : Any)
}
