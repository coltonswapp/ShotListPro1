//
//  TextFieldCell.swift
//  ShotListPro
//
//  Created by Jared on 10/20/20.
//

import Foundation
import UIKit

class TextFieldCell : UITableViewCell, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
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
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    var datePicker : UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    var pickerField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Select One"
        textField.backgroundColor = UIColor(named : "grey")
        textField.layer.cornerRadius = 10
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    @objc func donePicker(_ sender : UIBarButtonItem) {
        pickerField.resignFirstResponder()
    }
    
    var pickerView : UIPickerView = {
        var pickerView = UIPickerView()
        return pickerView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setupConstraints()
        titleLbl.text = self.title
    }
    
    // MARK: -Picker View
    var cameras = ["Canon", "Sony", "Canon", "Sony", "Canon", "Sony", "Canon", "Sony", "Canon", "Sony"]
    var lenses = ["Sigma 18-35", "Nifty 50", "40mm"]
    var length = ["1", "2", "3", "4", "5", "6"]
    var mood = ["Fast", "Slow"]
    var needed = ["1", "2", "3", "4", "5"]
    var sections = ["Intro", "Middle", "End"]
    
    var timeMetric = ["Secs", "Mins", "Hours"]
    var shotsOrTakes = ["Shots", "Takes"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if result is Length {
            return 2
        } else if result is Needed {
            return 2
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if result is Camera {
            return cameras[row]
        } else if result is Lens {
            return lenses[row]
        } else if result is Length {
            if component == 0 {
                return length[row]
            } else if component == 1 {
                return timeMetric[row]
            } else {
                return "Error"
            }
        } else if result is Mood {
            return mood[row]
        } else if result is Needed {
            if component == 0 {
                return needed[row]
            } else if component == 1 {
                return shotsOrTakes[row]
            } else {
                return "Error"
            }
        } else if result is Section {
            return sections[row]
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if result is Camera {
            return cameras.count
        } else if result is Lens {
            return lenses.count
        } else if result is Length {
            if component == 0 {
                return length.count
            } else if component == 1 {
                return timeMetric.count
            } else {
                return 0
            }
        } else if result is Mood {
            return mood.count
        } else if result is Needed {
            if component == 0 {
                return needed.count
            } else if component == 1 {
                return shotsOrTakes.count
            } else {
                return 0
            }
        } else if result is Section {
            return sections.count
        } else {
            return 0
        }
    }
    
    // MARK: - Used for time of shot.
    var lengthTime = ""
    var lengthTimeMetric = ""
    
    // MARK: - Used for needed
    var numOfShots = ""
    var shotType = ""
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if result is Camera {
            
            self.delegate?.valueDidChange(key: self.key, value: cameras[row])
            (result as! Camera).string = cameras[row]
            self.pickerField.text = cameras[row]
            
        } else if result is Lens {
            
            self.delegate?.valueDidChange(key: self.key, value: lenses[row])
            self.pickerField.text = lenses[row]
            (result as! Lens).string = lenses[row]
            
        } else if result is Length {
            if component == 0 {
                lengthTime = length[row]
            } else if component == 1 {
                lengthTimeMetric = timeMetric[row]
            }
            self.delegate?.valueDidChange(key: self.key, value: lengthTime + " " + lengthTimeMetric)
            self.pickerField.text = lengthTime + " " + lengthTimeMetric
            (result as! Length).string = lengthTime + " " + lengthTimeMetric
            
        } else if result is Mood {
            
            self.delegate?.valueDidChange(key: self.key, value: mood[row])
            (result as! Mood).string = mood[row]
            self.pickerField.text = mood[row]
            
        } else if result is Needed {
            if component == 0 {
                numOfShots = needed[row]
            } else if component == 1 {
                shotType = shotsOrTakes[row]
            }
            self.delegate?.valueDidChange(key: self.key, value: numOfShots + " " + shotType)
            self.pickerField.text = numOfShots + " " + shotType
            (result as! Needed).string = numOfShots + " " + shotType
            
        } else if result is Section {
            self.delegate?.valueDidChange(key: self.key, value: sections[row])
            self.pickerField.text = sections[row]
            (result as! Section).string = sections[row]
        }
    }
    
    func setupConstraints() {
        
        contentTextField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.contentView.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        titleLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true

        if result is Camera || result is Lens || result is Length || result is Mood || result is Needed || result is Section {
            
            if result is Camera {
                pickerField.text = (result as? Camera)?.string
            } else if result is Lens {
                pickerField.text = (result as? Lens)?.string
            } else if result is Length {
                pickerField.text = (result as? Length)?.string
            } else if result is Mood {
                pickerField.text = (result as? Mood)?.string
            } else if result is Needed {
                pickerField.text = (result as? Needed)?.string
            } else if result is Section {
                pickerField.text = (result as? Section)?.string
            }
            
            
            
            
            self.addSubview(pickerField)
            print(result)
            pickerField.translatesAutoresizingMaskIntoConstraints = false
            pickerField.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
            pickerField.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
            pickerField.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
            pickerField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            pickerField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            pickerField.addTarget(self, action: #selector(self.datePickerChanged(picker:)), for: .valueChanged)
            pickerField.inputView = pickerView
            // MARK: -Done Button
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
            toolBar.sizeToFit()

            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            
            toolBar.setItems([spaceButton, doneButton], animated: false)
            pickerField.inputAccessoryView = toolBar
            
            
        } else if result is String {
            self.addSubview(contentTextField)
            contentTextField.text = result as? String ?? ""
            contentTextField.translatesAutoresizingMaskIntoConstraints = false
            contentTextField.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
            contentTextField.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
            contentTextField.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
            contentTextField.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
            contentTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        } else if result is Date {
            self.addSubview(datePicker)
            datePicker.date = result as? Date ?? Date()
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            datePicker.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
            datePicker.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
            datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            datePicker.heightAnchor.constraint(equalToConstant: 40).isActive = true
            datePicker.addTarget(self, action: #selector(self.datePickerChanged(picker:)), for: .valueChanged)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        result = textField.text ?? ""
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        result = textField.text
        self.delegate?.valueDidChange(key: self.key, value: textField.text ?? "")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        result = textField.text
        self.delegate?.valueDidChange(key: self.key, value: textField.text ?? "")
    }

    @objc func datePickerChanged(picker: UIDatePicker) {
        result = picker.date
        self.delegate?.valueDidChange(key: self.key, value: picker.date)
    }
}


protocol TextFieldCellDelegate {
    func valueDidChange(key : String, value : Any)
}
