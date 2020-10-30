//
//  SignUpViewController.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/28/20.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: -Delegates
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        if nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            
            presentError2(message: "All field are required to create an account!", style: .alert)
            
        }
        
        guard let nameText = nameTextField.text, !nameText.isEmpty,
              let emailText = emailTextField.text, !emailText.isEmpty,
              let passwordText = passwordTextField.text, !passwordText.isEmpty,
              let confirmPasswordText = confirmPasswordTextField.text, !confirmPasswordText.isEmpty else { return }
        
        if passwordText != confirmPasswordText {
            presentError2(message: "Passwords do not match!", style: .alert)
        }
        
        Auth.auth().createUser(withEmail: emailText, password: confirmPasswordText) { (authResult, error) in
            if let error = error {
                print("Error in \(#function): On Line \(#line) : \(error.localizedDescription) \n---\n \(error)")
                self.presentError2(message: error.localizedDescription, style: .alert)
            }
            
            if error == nil {
                Auth.auth().signIn(withEmail: emailText, password: passwordText) { (user, error) in
                    if let error = error {
                        print("Error in \(#function): On Line \(#line) : \(error.localizedDescription) \n---\n \(error)")
                        
                    }
                    
                    
                    if let user = user?.user {
                        let newUser = User(name: nameText, email: emailText, userID: user.uid)
                        UserController.sharedInstance.createUser(name: newUser.name, email: newUser.email, userID: user.uid, isFTFMember: newUser.isFTFMember)
                        UserController.sharedInstance.retrieveUser(userId: user.uid) { (result) in
                            switch result {
                            case .success(let user):
                                print("\(user?.name ?? "") was successfully signed in.")
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let VC = storyboard.instantiateViewController(identifier: "projectlist")
                                self.view.window?.rootViewController = VC
                                
                                self.emailTextField.text = nil
                                self.passwordTextField.text = nil
                            case .failure(let error):
                                print("Error in \(#function): On Line \(#line) : \(error.localizedDescription) \n---\n \(error)")
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
