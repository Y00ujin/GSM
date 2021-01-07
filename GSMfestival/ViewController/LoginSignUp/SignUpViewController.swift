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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var classNumberTextField: UITextField!
    
    var grade: Int! = 0
    var classNumber: Int! = 0
    var number: Int! = 0
    var name: String! = ""
    
    var laptopUserByGrade = [[String]](repeating: Array(repeating: "",count: 0), count: 3)

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        TextFieldUnderLine(textfield: emailTextField)
        TextFieldUnderLine(textfield: passwordTextField)
        TextFieldUnderLine(textfield: numberTextField)
        TextFieldUnderLine(textfield: nameTextField)
        TextFieldUnderLine(textfield: classNumberTextField)
        TextFieldUnderLine(textfield: gradeTextField)
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!

        ) { (user, error) in

            if user !=  nil{
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
                
                UserDefaults.standard.set(self.nameTextField.text, forKey: "name")
                
                // 반 저장
                UserDefaults.standard.set(self.classNumberTextField.text, forKey: "classNumber")
                
                // 학년저장
                UserDefaults.standard.set(self.gradeTextField.text, forKey: "grade")
                
                UserDefaults.standard.set(self.numberTextField.text, forKey: "number")
                
                self.grade = UserDefaults.standard.integer(forKey: "grade")
                self.classNumber = UserDefaults.standard.integer(forKey: "classNumber")
                self.number = UserDefaults.standard.integer(forKey: "number")
                self.name = UserDefaults.standard.string(forKey: "name")
                
                if(self.grade == 1){
                    if(self.number < 10){
                        self.laptopUserByGrade[0].append("\(self.grade ?? 0)\(self.classNumber ?? 0)0\(self.number ?? 0) \(self.name ?? "")")
                    }else{
                        self.laptopUserByGrade[0].append("\(self.grade ?? 0)\(self.classNumber ?? 0)\(self.number ?? 0) \(self.name ?? "")")
                    }
                }else if(self.grade == 2){
                    if(self.number < 10){
                        self.laptopUserByGrade[1].append("\(self.grade ?? 0)\(self.classNumber ?? 0)0\(self.number ?? 0) \(self.name ?? "")")
                    }else{
                        self.laptopUserByGrade[1].append("\(self.grade ?? 0)\(self.classNumber ?? 0)\(self.number ?? 0) \(self.name ?? "")")
                    }
                }else{
                    if(self.number < 10){
                        self.laptopUserByGrade[2].append("\(self.grade ?? 0)\(self.classNumber ?? 0)0\(self.number ?? 0) \(self.name ?? "")")
                    }else{
                        self.laptopUserByGrade[2].append("\(self.grade ?? 0)\(self.classNumber ?? 0)\(self.number ?? 0) \(self.name ?? "")")
                    }
                }
                
                
                
                print("laptopuserBygrade : \(self.laptopUserByGrade)")
                
                UserDefaults.standard.set(self.laptopUserByGrade, forKey: "laptopUserByGrade")

                // 이름 저장
                UserDefaults.standard.set(self.nameTextField.text, forKey: "name")
            }else{
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
