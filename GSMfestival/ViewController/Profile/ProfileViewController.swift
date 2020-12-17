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
    
    var emailString: String!
    var passwardString: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        emailLabel.text = UserDefaults.standard.string(forKey: "email")
        passwardLabel.text = UserDefaults.standard.string(forKey: "passward")


        print("email : \(String(describing: emailLabel.text))")
        print("passward: \(String(describing: passwardLabel.text))")
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
