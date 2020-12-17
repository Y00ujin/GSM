//
//  LoginViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/05.
//

import UIKit
import Firebase



class LoginViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var pwShowButton: UIButton!
    
    let failLogin = UIAlertController(title: "경고", message: "이메일과 비밀번호 중 틀린 부분이 있습니다.", preferredStyle: UIAlertController.Style.alert)
    let writeAgain = UIAlertAction(title: "다시 입력하기", style: UIAlertAction.Style.default, handler: nil)
        
    var iconClick: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 모바일 키보드 리턴 키 done으로 바꾸기
        passwardTextField.returnKeyType = .done
        failLogin.addAction(writeAgain)

    }
    
    override func viewDidLayoutSubviews() {
        TextFieldUnderLine(textfield: emailTextField)
        TextFieldUnderLine(textfield: passwardTextField)
    }
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwardTextField.text!) { [self] (user, error) in

                   if user != nil{
                    let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "tabBarViewController")
                    self.navigationController?.pushViewController(pushVC!, animated: true)
                       print("login success")
                    UserDefaults.standard.set(emailTextField.text, forKey: "email")
                    UserDefaults.standard.set(passwardTextField.text, forKey: "passward")
                    
                    print("email : \(String(describing: self.emailTextField.text))")
                    print("passward: \(String(describing: self.passwardTextField.text))")

                   }else{
                        present(failLogin, animated: true, completion: nil)
                        print("login fail")
                   }

             }
    }
    @IBAction func pwShowButton(_ sender: Any) {
        if(iconClick == true) {
            passwardTextField.isSecureTextEntry = false
            let eyeImage = UIImage(systemName: "eye")
            pwShowButton.setImage(eyeImage, for: .normal)
        } else {
            passwardTextField.isSecureTextEntry = true
            let eyeImage = UIImage(systemName: "eye.slash")
            pwShowButton.setImage(eyeImage, for: .normal)

        }

        iconClick = !iconClick
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
