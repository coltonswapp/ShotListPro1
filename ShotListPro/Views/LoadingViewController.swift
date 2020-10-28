//
//  LoadingViewController.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/28/20.
//

import UIKit
import FirebaseAuth

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        checkForCurrentUser()
    }
    
    func checkForCurrentUser() {
        if Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "signIn")
             VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: false, completion: nil)
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "projectlist")
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: false, completion: nil)
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
