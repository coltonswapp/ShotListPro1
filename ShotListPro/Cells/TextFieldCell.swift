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
        return datePicker
    }()
    
    var divider : UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(named: "grey")
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
        titleLbl.text = self.title
    }
    
    func setupConstraints() {
        
        contentTextField.delegate = self
        
        self.addSubview(titleLbl)
        self.addSubview(divider)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        titleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: self.divider.leftAnchor, constant: 10).isActive = true
        titleLbl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        divider.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        if result is String {
            self.addSubview(contentTextField)
            result = contentTextField.text
            contentTextField.translatesAutoresizingMaskIntoConstraints = false
            contentTextField.leftAnchor.constraint(equalTo: self.divider.rightAnchor, constant: 10).isActive = true
            contentTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            contentTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
            contentTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
        } else if result is Date {
            self.addSubview(datePicker)
            result = datePicker.date
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            datePicker.leftAnchor.constraint(equalTo: self.divider.rightAnchor, constant: 10).isActive = true
            datePicker.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            datePicker.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
            datePicker.addTarget(self, action: #selector(self.datePickerChanged(picker:)), for: .valueChanged)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.valueDidChange(key: self.key, value: self.result)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        self.delegate?.valueDidChange(key: self.key, value: picker.date)
    }
}


protocol TextFieldCellDelegate {
    func valueDidChange(key : String, value : Any)
}
