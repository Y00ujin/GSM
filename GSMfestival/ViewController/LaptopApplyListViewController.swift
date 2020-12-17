//
//  LaptopApplyListViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/10.
//

import UIKit

class LaptopApplyListViewController:  UIViewController{
    
    @IBOutlet weak var FirstLaptopUserLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var laptopUser: Bool = false
    let userName = UIDevice.current.name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제스쳐 없애기
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        if(laptopUser == true){
            FirstLaptopUserLabel.text = "이름 : \(userName)"
        }
        else{
            FirstLaptopUserLabel.text = ""
        }
    }
    @IBAction func backButton(_ sender: Any) {
        // pop
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}
