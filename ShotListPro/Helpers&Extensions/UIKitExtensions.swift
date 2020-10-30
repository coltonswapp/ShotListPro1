//
//  UIKitExtensions.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/28/20.
//

import UIKit
import SwiftUI
extension UIViewController {
    func presentError1(localizedError: NSError) {
        let alertController = UIAlertController(title: "WHOOPS!", message: localizedError.description, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "TRY AGAIN", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
    
    func presentError2(message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: "WHOOPS!", message: message, preferredStyle: style)
        let dismissAction = UIAlertAction(title: "TRY AGAIN", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
