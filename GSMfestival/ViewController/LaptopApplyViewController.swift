//
//  LaptopApplyViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/09.
//

import UIKit



class LaptopApplyViewController: UIViewController {

    
    var laptopUser: Bool = false
    
    let userName: String = UIDevice.current.name
    
    @IBOutlet weak var applyAfter: UIImageView!
    
    @IBOutlet weak var applyBefore: UIImageView!
    
    // 테이블 뷰 셀에들어갈 거
    var laptopUserList: [String]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyAfter.isHidden = true
    }

    
    // 노트북 신청 버튼
    @IBAction func laptopApplyBtn(_ sender: Any) {

        laptopUser = true
        laptopUserList.append("\(UserDefaults.standard.string(forKey: "name") ?? "")")
        

        applyBefore.isHidden = true
        applyAfter.isHidden = false
    }

    
    @IBAction func showLaptopUserList(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let listViewController = segue.destination as? LaptopApplyListViewController {
            listViewController.laptopUser = laptopUser
            listViewController.laptopUserList = laptopUserList
        }
    }
}

