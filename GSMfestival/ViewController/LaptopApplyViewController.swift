//
//  LaptopApplyViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/09.
//

import UIKit



class LaptopApplyViewController: UIViewController {
    
    @IBOutlet var laptopApplySituationLabel: UILabel!
    
    @IBOutlet weak var laptopApplyCancelOutlet: UIButton!
    
    @IBOutlet weak var profileButton: UIButton!
    
    var laptopUser: Bool = false
    let userName: String = UIDevice.current.name
    
//    var laptopUserList: Array<String> = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        laptopApplyCancelOutlet.isHidden = true
        
        profileButton.contentVerticalAlignment = .fill
        profileButton.contentHorizontalAlignment = .fill
        profileButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    // 노트북 신청 버튼
    @IBAction func laptopApplyBtn(_ sender: Any) {
        laptopApplyCancelOutlet.setTitle("신청 취소", for: .normal)
        laptopApplySituationLabel.text = "노트북 신청 함"
        laptopUser = true
        laptopApplyCancelOutlet.isHidden = false
    }
    
    // 노트북 신청 취소 버튼
    @IBAction func laptopApplyCancelBtn(_ sender: Any) {
        if (laptopUser == true) {
            laptopApplySituationLabel.text = "노트북 안 함"
            laptopApplyCancelOutlet.setTitle("", for: .normal)
            laptopUser = false
            laptopApplyCancelOutlet.isHidden = true
            
        }
    }
    @IBAction func showLaptopUserList(_ sender: Any) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let listViewController = segue.destination as? LaptopApplyListViewController {
            listViewController.laptopUser = laptopUser
        }
    }
}

