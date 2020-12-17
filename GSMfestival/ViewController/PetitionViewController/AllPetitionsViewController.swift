//
//  AllPetitionsViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/29.
//

import UIKit

class AllPetitionsViewController: UIViewController {
    
    var petitionContent: String!
    var petitionTitle: String!
    
    let cellIdentifier = "petitionTableViewCell"
    
    @IBOutlet weak var petitionTitleLabel: UILabel!
    @IBOutlet weak var petitionContentLabel: UILabel!
    var petitionList = ["1. 청원 1", "2. 청원 2"]


    
    override func viewDidLoad() {
        super.viewDidLoad()
//        gaurd let titles = UserDefaults.standard.array(forKey: "petitionTitle") as? [String]
//        petitionTitleLabel.text = titles[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}
