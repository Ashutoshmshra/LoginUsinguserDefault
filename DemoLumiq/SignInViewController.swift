//
//  SignInViewController.swift
//  DemoLumiq
//
//  Created by Mobikasa on 5/31/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    let emailTextField =  UITextField(frame: CGRect(x: 40, y: 300, width: 300, height: 40))
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1)
        self.createEmailTextField()
        self.createRegisterButton()
    }
    
    // MARK:- Create email text field
    func createEmailTextField(){
        
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.autocorrectionType = UITextAutocorrectionType.no
        emailTextField.keyboardType = UIKeyboardType.default
        emailTextField.returnKeyType = UIReturnKeyType.done
        emailTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        emailTextField.delegate = self
        self.view.addSubview(emailTextField)
    }
    // MARK:- Create Register button
    func createRegisterButton(){
        let button:UIButton = UIButton(frame: CGRect(x: 140, y: 370, width: 100, height: 30))
        button.backgroundColor = .black
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 13
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width:1, height:0)
        button.layer.masksToBounds = false
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
    }
    //MARK:- Register Button action to email varification
    @objc func buttonClicked() {
        print("Button Clicked")
        if emailTextField.text == nil || emailTextField.text == "" {
            self.showAlert(message: "Please enter the email")
        }
            
        else if (emailTextField.text?.isValidEmail())!{
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "isUserLoggedIn")
            defaults.synchronize()
            AppInitializer.shared.moveToHomeScreen()//------- set home view
        }
        else{
            self.showAlert(message: "Please check email format ")
        }
        
    }
    //MARK:- SendData To 
    func sendToMainScreen(){
        let vc = UIStoryboard.init(name:"Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK:- show alert on Register button action to varify email
    func showAlert(message: String){
        // create the alert
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
// MARK:- Email vaidation Function
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
