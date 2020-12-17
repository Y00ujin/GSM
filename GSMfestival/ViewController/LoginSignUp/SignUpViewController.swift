//
//  SignUpViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/05.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        TextFieldUnderLine(textfield: emailTextField)
        TextFieldUnderLine(textfield: passwordTextField)
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!

        ) { (user, error) in

            if user !=  nil{
                self.dismiss(animated: true, completion: nil)
            }

            else{
                print(error)
                print("register failed")

            }
        }
    }
    
    func TextFieldUnderLine(textfield: UITextField){
        textfield.borderStyle = .none
                let border = CALayer()
        border.frame = CGRect(x: 0, y: textfield.frame.size.height-1, width: textfield.frame.width, height: 1)
        border.backgroundColor = CGColor(red: 37/255, green: 94/255, blue: 141/255, alpha: 1)
        textfield.layer.addSublayer((border))
        textfield.textAlignment = .center
        textfield.textColor = UIColor.black
    }
}
