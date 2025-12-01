//
//  ViewController.swift
//  Fintap
//
//  Created by diana on 06.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var logIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUp.backgroundColor = UIColor.purple
           signUp.setTitleColor(.white, for: .normal)
           signUp.layer.cornerRadius = 10
           signUp.layer.borderWidth = 1
           signUp.layer.borderColor = UIColor.white.cgColor
           signUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
    }

    @IBAction func logInPressed(_ sender: UIButton) {
        openNextScreen(identifier: "LoginViewController")
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        openNextScreen(identifier: "SignUpViewController")
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        openNextScreen(identifier: "SignUpViewController")
    }
    func openNextScreen(identifier: String) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: identifier)
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated:  true)
    }
}


