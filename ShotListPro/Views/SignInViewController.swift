//
//  SignInViewController.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/28/20.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func signInButtontapped(_ sender: Any) {
        
        guard let emailText = emailTextField.text, !emailText.isEmpty,
              let passwordText = passwordTextField.text, !passwordText.isEmpty else { return }
        
        Auth.auth().signIn(withEmail: emailText, password: passwordText) { (user, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                self.presentError1(localizedError: error as NSError)
                // Present some sort of could not log in alert
            }
            if let user = user?.user {
                UserController.sharedInstance.retrieveUser(userId: user.uid) { (result) in
                    switch result {
                    case .success(let user):
                        print("\(user?.name ?? "") was successfully signed in.")
//                        self.performSegue(withIdentifier: self.vcIdentifier, sender: nil)
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let VC = storyboard.instantiateViewController(identifier: "projectlist")
//                        VC.modalPresentationStyle = .fullScreen
                        self.view.window?.rootViewController = VC
//                        self.present(VC, animated: true, completion: nil)
                        
                        self.emailTextField.text = nil
                        self.passwordTextField.text = nil
                    case .failure(let error):
                        print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")

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
