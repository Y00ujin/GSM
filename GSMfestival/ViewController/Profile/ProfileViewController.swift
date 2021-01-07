//
//  ProfileViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/14.
//

import UIKit

class ProfileViewController: UIViewController{
    
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwardLabel: UILabel!
    @IBOutlet weak var nameNumberLabel: UILabel!
    
    var emailString: String!
    var passwardString: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(UserDefaults.standard.string(forKey: "email")!)
        print(UserDefaults.standard.string(forKey: "passward")!)

        nameNumberLabel.text = "\(UserDefaults.standard.string(forKey: "number") ?? "") \(UserDefaults.standard.string(forKey: "name") ?? "")"
        emailLabel.text = UserDefaults.standard.string(forKey: "email")
        passwardLabel.text = UserDefaults.standard.string(forKey: "passward")


        print("email : \(String(describing: emailLabel.text))")
        print("passward: \(String(describing: passwardLabel.text))")
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}
