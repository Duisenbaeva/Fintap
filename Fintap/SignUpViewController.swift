//
//  SignUpViewController.swift
//  Fintap
//
//  Created by diana on 07.11.2025.
//

import UIKit
//import FirebaseAuth


class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorName: UILabel!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var errorEmail: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorConfirm: UILabel!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var errorPassword: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [errorName, errorEmail, errorPassword, errorConfirm].forEach { $0?.isHidden = true }

        
        errorName.isHidden = true
        errorEmail.isHidden = true
        errorPassword.isHidden = true
        errorConfirm.isHidden = true
        fullnameTextField.delegate = self
        emailTextField.delegate = self
        
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        openNextScreen(identifier: "LoginViewController")
    }
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        [errorName, errorEmail, errorPassword, errorConfirm].forEach { $0?.isHidden = true }
        
        guard let fullname = fullnameTextField.text, !fullname.isEmpty else {
            errorName.isHidden = false
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            errorEmail.isHidden = false
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            errorPassword.isHidden = false
            return
        }
        
        guard let confirm = confirmTextField.text, !confirm.isEmpty else {
            errorConfirm.isHidden = false
            return
        }
        
        // Password match check
        guard password == confirm else {
            showAlert(message: "Passwords do not match ❌")
            return
        }
        
        // Firebase sign up
//        let cleanedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
//        let cleanedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        Auth.auth().createUser(withEmail: cleanedEmail, password: cleanedPassword) { result, error in
//            if let error = error {
//                self.showAlert(message: "⚠️ Error: \(error.localizedDescription)")
//                return
//            }
//            
//            // Success
//            self.showAlert(message: "✅ Successfully signed up!");   self.openNextScreen(identifier: "SetProfileViewController")
//        }
    
    }
        
        func openNextScreen(identifier: String) {
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let nextVC = storyboard.instantiateViewController(withIdentifier: identifier)
               nextVC.modalTransitionStyle = .crossDissolve
               nextVC.modalPresentationStyle = .fullScreen
               present(nextVC, animated: true)
           }
        
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
    }

