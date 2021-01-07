//
//  AllPetitionsViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/29.
//

import UIKit

class AllPetitionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var petitionContent: String!
    var petitionTitle: String!
    
    var agreementNumber: [Int]! = []
    var oppositionNumber: [Int]! = []
    
    var agreementSelected: [Bool]! = []
    var oppositionSelected: [Bool]! = []
    
    let cellIdentifier = "petitionTableViewCell"
        
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PetitionTitleContentTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PetitionTitleContentTableViewCell
        
        // userDefault의 청원 배열을 tableview의 cell에 넣어준다.
        let titleText: String = (title()?[indexPath.row])!
        let contentText: String = (content()?[indexPath.row])!
        
        let agreementNumberText: String = (getAgreementNumber()?[indexPath.row])!
        let oppositionNumberText: String = (getOppositionNumber()?[indexPath.row])!
        
        cell.oppositionNumberLabel.text = oppositionNumberText
        cell.agreementNumberLabel.text = agreementNumberText
        
        cell.tableViewCellTitleLabel.text = titleText
        cell.tableViewCellContentLabel.text = contentText
        
        cell.delegate = self
        
        return cell
    }
    
    // title any -> String func
    func title() -> [String]? {
       guard let titles = UserDefaults.standard.array(forKey: "petitionTitle") as? [String] else {
          return nil
       }
       return titles
    }
    
    func content() -> [String]? {
        guard let titles = UserDefaults.standard.array(forKey: "petitionContent") as? [String] else {
           return nil
        }
        return titles
     }
    
    // 찬성 수
    func getAgreementNumber() -> [Int]? {
        guard let agreementNumber = UserDefaults.standard.array(forKey: "agreementNumber") as? [Int] else {
            return nil
        }
        return agreementNumber
    }
    
    // 반대 수
    func getOppositionNumber() -> [Int]? {
       guard let oppositionNumber = UserDefaults.standard.array(forKey: "oppositionNumber") as? [Int] else {
          return nil
       }
       return oppositionNumber
    }
    
    // 찬성했는지 안했는지
    func getAgreementSelected() -> [Bool]? {
       guard let agreementSelected = UserDefaults.standard.array(forKey: "agreementSelected") as? [Bool] else {
          return nil
       }
       return agreementSelected
    }
    
    // 반대했는지 안했는지
    func getOppositionSelected() -> [Bool]? {
        guard let oppositionSelected = UserDefaults.standard.array(forKey: "oppositionSelected") as? [Bool] else {
           return nil
        }
        return oppositionSelected
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        agreementNumber = getAgreementNumber()
        oppositionNumber = getOppositionNumber()
        
        agreementSelected = getAgreementSelected()
        oppositionSelected = getOppositionSelected()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension AllPetitionsViewController: SendButtonDelegate {
    func agreementButtonAction(sender: UIButton, cell: UITableViewCell) {
        let arrayIndex = tableView.indexPath(for: cell)!.row
        print("찬성버튼 누를때 index : \(arrayIndex)")
        if(oppositionSelected[arrayIndex] == false){
            if(agreementSelected[arrayIndex] == false){
                agreementNumber[arrayIndex] = agreementNumber[arrayIndex] + 1
                agreementSelected[arrayIndex] = true
            } else {
                agreementNumber[arrayIndex] = agreementNumber[arrayIndex] - 1
                agreementSelected[arrayIndex] = false
            }
        }
        
        UserDefaults.standard.set(getAgreementNumber, forKey: "agreementNumber")
        UserDefaults.standard.set(getOppositionNumber, forKey: "oppositionNumber")
        
        UserDefaults.standard.set(getAgreementSelected, forKey: "agreementSelected")
        UserDefaults.standard.set(getOppositionSelected, forKey: "oppositionSelected")
        
        tableView.reloadData()
    }
    
    func oppositionButtonAction(sender: UIButton, cell: UITableViewCell) {
        let arrayIndex = tableView.indexPath(for: cell)!.row
        if(agreementSelected[arrayIndex] == false){
            if(oppositionSelected[arrayIndex] == false){
                oppositionNumber[arrayIndex] = oppositionNumber[arrayIndex] + 1
                oppositionSelected[arrayIndex] = true
            } else {
                oppositionNumber[arrayIndex] = oppositionNumber[arrayIndex] - 1
                oppositionSelected[arrayIndex] = false
            }
        }
        
        UserDefaults.standard.set(getAgreementNumber, forKey: "agreementNumber")
        UserDefaults.standard.set(getOppositionNumber, forKey: "oppositionNumber")
        
        UserDefaults.standard.set(getAgreementSelected, forKey: "agreementSelected")
        UserDefaults.standard.set(getOppositionSelected, forKey: "oppositionSelected")
        
        tableView.reloadData()
    }
}


