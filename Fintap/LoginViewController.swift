//
//  LoginViewController.swift
//  Fintap
//
//  Created by diana on 07.11.2025.
//

import UIKit
//import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorEmail: UILabel!
    @IBOutlet weak var errorPassword: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorEmail.isHidden = true
        errorPassword.isHidden = true
    }
    

    @IBAction func signUpButtonPressed(_ sender: Any) {
        openNextScreen(identifier: "SignUpViewController")
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        var isValid = true
        if emailTextField.text?.isEmpty == true {
            errorEmail.isHidden = false
            isValid = false
        } else {
            errorEmail.isHidden = true
            
        }
        
        if passwordTextField.text?.isEmpty == true {
            errorPassword.isHidden = false
            isValid = false
        } else {
            errorPassword.isHidden = true
            
        }
        if isValid {
            openNextScreen(identifier: "SetProfileViewController")
        }
//        if isValid {
//            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//            
//            
//            Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
//                           guard let self = self else { return }
//                           
//                           if let error = error {
//                               self.showAlert(message: "Қате: \(error.localizedDescription)")
//                           } else {
//                               self.showAlert(message: "✅ Кіру сәтті өтті!")
//                               self.openNextScreen(identifier: "SetProfileViewController")
//                           }
//            }
//        }/Users/diana/Documents/Fintap/Fintap.xcodeproj
        
//        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//            
//            guard !email.isEmpty else {
//                errorEmail.isHidden = false
//                return
//            }
//            guard !password.isEmpty else {
//                errorPassword.isHidden = false
//                return
//            }
            
            // ✅ Бұл Login үшін signIn болуы керек
//            Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
//                guard let self = self else { return }
//                
//                if let error = error {
//                    self.showAlert(message: "Қате: \(error.localizedDescription)")
//                } else {
//                    // 🔹 Firebase сәтті кірген соң экранға өту
//                    self.openNextScreen(identifier: "SetProfileViewController")
//                }
//            }
    }
    func openNextScreen(identifier: String) {
        print("Trying to open: \(identifier)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: identifier)
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated:  true)
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}
