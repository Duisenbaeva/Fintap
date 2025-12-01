//
//  SetProfileViewController.swift
//  Fintap
//
//  Created by diana on 07.11.2025.
//

import UIKit

class SetProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var designButton: UIButton!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var consultingButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var errorName: UILabel!
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var errorCurrency: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         
        resetButtons()
        errorName.isHidden = true
        errorCurrency.isHidden = true
        nameTextField.delegate = self
        currencyTextField.delegate = self
        
    }
    
    func resetButtons() {
           let buttons = [designButton, copyButton, consultingButton, otherButton]
           for btn in buttons {
               btn?.setImage(UIImage(systemName: "square"), for: .normal)
               btn?.tintColor = .lightGray
           }
       }
       
       @IBAction func incomeTypeTapped(_ sender: UIButton) {
           resetButtons()
           sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
           sender.tintColor = UIColor.systemPurple
       }
    
    func openNextScreen(identifier: String) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: identifier)
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated:  true)
    }
    
    @IBAction func continuePressed(_ sender: UIButton) {
        var isValid = true
        
        if nameTextField.text?.isEmpty == true {
            errorName.isHidden = false
            isValid = false
        } else {
            errorName.isHidden = true
        }
        
        if currencyTextField.text?.isEmpty == true {
            errorCurrency.isHidden = false
            isValid = false
        } else {
            errorCurrency.isHidden = true
        }
        if isValid {
            openNextScreen(identifier: "HomeViewController")
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder() 
           return true
       }
}
