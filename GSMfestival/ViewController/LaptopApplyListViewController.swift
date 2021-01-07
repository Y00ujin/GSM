//
//  LaptopApplyListViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/10.
//

import UIKit

class LaptopApplyListViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return laptopUserByGrade.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "1학년"
            
        } else if section == 1 {
            return "2학년"
            
        } else {
            return "3학년"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return laptopUserByGrade[0].count
            
        } else if section == 1 {
            return laptopUserByGrade[1].count
            
        } else {
            return laptopUserByGrade[2].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = laptopUserListTableView.dequeueReusableCell(withIdentifier: "laptopUserListCell", for: indexPath)
            
        cell.textLabel?.text = laptopUserByGrade[indexPath.section][indexPath.row]
            
            return cell

    }
    
    @IBOutlet weak var laptopUserListTableView: UITableView!
    
    @IBOutlet weak var backButton: UIButton!
    
    var laptopUser: Bool = false
    var laptopUserByGrade = [[String]](repeating: Array(repeating: "",count: 0), count: 3)
    
    var laptopUserList: [String]! {
        didSet {
            laptopUserListTableView?.reloadData()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("laptopuserBygrade : \(UserDefaults.standard.integer(forKey: "laptopUserByGrade"))")
        print("laptopuserList : \(laptopUserList ?? [""])")
        
        self.laptopUserByGrade = UserDefaults.standard.array(forKey: "laptopUserByGrade") as! [[String]]
        
        laptopUserListTableView?.reloadData()

    }
    

    
    @IBAction func backButton(_ sender: Any) {
        // pop
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}
