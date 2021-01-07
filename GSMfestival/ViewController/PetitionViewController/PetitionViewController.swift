//
//  WritingPetitionViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/14.
//

import UIKit



class PetitionViewController: UIViewController{
    var agreementNumber: [Int]! = []
    var oppositionNumber: [Int]! = []
    
    var agreementSelected: [Bool]! = []
    var oppositionSelected: [Bool]! = []
    
    var petitionStartedDateArray: [String]! = []
    var petitionFinishedDateArray: [String]! = []
    
    var petitionContent: String!
    var petitionTitle: String!
    
    
    // 찬성 버튼
    @IBOutlet weak var agreementButton: UIButton!
    

    // 찬성 수 라벨
    @IBOutlet weak var agreementNumberLabel: UILabel!
    
    // 반대 버튼
    @IBOutlet weak var OppositionButton: UIButton!
    
    
    var agreementNumberString: String! = ""
    var oppositionNumberString: String! = ""
    
    // 반대 수 라벨
    @IBOutlet weak var oppositionNumberLabel: UILabel!
    
    @IBOutlet weak var petitionContentView: UITextView!
    
    @IBOutlet weak var petitionTitleLabel: UILabel!
    
    @IBOutlet weak var dateView: UIView!
    
    @IBOutlet weak var petitionStartedDateLabel: UILabel!
    
    @IBOutlet weak var petitionFinishedDateLabel: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    
    var arrayIndex: Int! = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateView.layer.borderWidth = 0.5
        dateView.layer.borderColor = CGColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1)
        
        profileButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    
    // 반대 버튼
    @IBAction func oppositionButton(_ sender: Any) {
        if(agreementSelected[arrayIndex] == false){
            if(oppositionSelected[arrayIndex] == false){
                oppositionNumber[arrayIndex] = oppositionNumber[arrayIndex] + 1
                oppositionNumberLabel.text = String(oppositionNumber[arrayIndex])
                oppositionSelected[arrayIndex] = true
            } else {
                oppositionNumber[arrayIndex] = oppositionNumber[arrayIndex] - 1
                oppositionNumberLabel.text = String(oppositionNumber[arrayIndex])
                oppositionSelected[arrayIndex] = false
            }
        }
        
        // userdefault에 title, content 넣기
        UserDefaults.standard.set(petitiontitleList, forKey: "petitionTitle")
        UserDefaults.standard.set(petitioncontentList, forKey: "petitionContent")
        
        UserDefaults.standard.set(agreementNumber, forKey: "agreementNumber")
        UserDefaults.standard.set(oppositionNumber, forKey: "oppositionNumber")
        
        UserDefaults.standard.set(agreementSelected, forKey: "agreementSelected")
        UserDefaults.standard.set(oppositionSelected, forKey: "oppositionSelected")
    }
    
    // 찬성 버튼
    @IBAction func agreementButton(_ sender: Any) {
        print("찬성버튼 누를때 index : \(arrayIndex)")
        print("oppositionSelected count : \(oppositionSelected.count)")
        if(oppositionSelected[arrayIndex] == false){
            if(agreementSelected[arrayIndex] == false){
                agreementNumber[arrayIndex] = agreementNumber[arrayIndex] + 1
                agreementNumberLabel.text = String(agreementNumber[arrayIndex])
                agreementSelected[arrayIndex] = true
            } else {
                agreementNumber[arrayIndex] = agreementNumber[arrayIndex] - 1
                agreementNumberLabel.text = String(agreementNumber[arrayIndex])
                agreementSelected[arrayIndex] = false
            }
        }
        
        // userdefault에 title, content 넣기
        UserDefaults.standard.set(petitiontitleList, forKey: "petitionTitle")
        UserDefaults.standard.set(petitioncontentList, forKey: "petitionContent")
        
        UserDefaults.standard.set(agreementNumber, forKey: "agreementNumber")
        UserDefaults.standard.set(oppositionNumber, forKey: "oppositionNumber")
        
        UserDefaults.standard.set(agreementSelected, forKey: "agreementSelected")
        UserDefaults.standard.set(oppositionSelected, forKey: "oppositionSelected")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  vc = segue.destination as? WritingPetitionViewController {
            vc.delegate = self
            vc.petitionStartedDateArray = petitionStartedDateArray
            vc.petitionFinishedDateArray = petitionFinishedDateArray
        }
    }
    
    // 현재날짜 가져오는 함수
    func getCurrentDate() -> String{
        let today = Date()
        let todayFormatter = DateFormatter()
        todayFormatter.locale = Locale(identifier: "ko")
        todayFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = todayFormatter.string(from: Date())
        
        return currentDate

    }
    
    // 마감 날짜 가져오는 함수
    func tomorrowDate() -> String{
        let today = Date()
        let todayFormatter = DateFormatter()
        todayFormatter.locale = Locale(identifier: "ko")
        todayFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = todayFormatter.string(from: Date())
        let tomorrowFormatter = DateFormatter()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 30, to: today)
        tomorrowFormatter.locale = Locale(identifier: "ko")
        tomorrowFormatter.dateFormat = "yyyy-MM-dd"
        let tomorrowDate = tomorrowFormatter.string(from: tomorrow!)

        return tomorrowDate
        
    }

}



extension PetitionViewController: WritingPetitionDelegate {
    func submitBtn(title: String, content: String, petitionStartedDate: [String]!, petitionFinishedDate: [String]!, agreementNumber: [Int]!, oppositionNumber: [Int]!, agreementSelected: [Bool]!, oppositionSelected: [Bool]!, arrayIndex: Int!) {
        
        petitionContentView.text = "\(content)"
        petitionTitleLabel.text = "\(title)"
        
        oppositionNumberLabel.text = "\(oppositionNumber)"
        agreementNumberLabel.text = "\(agreementNumber)"

        
        self.agreementNumber.append(0)
        self.agreementSelected.append(false)
        self.oppositionNumber.append(0)
        self.oppositionSelected.append(false)
    
        
        self.arrayIndex = arrayIndex
        
        print("전달받은 arrayIndex  = \(arrayIndex)")
        
        petitionStartedDateLabel.text = petitionStartedDate[arrayIndex]
        petitionFinishedDateLabel.text = petitionFinishedDate[arrayIndex]
        
        petitionStartedDateArray = petitionStartedDate
        petitionFinishedDateArray = petitionFinishedDate
        
        print("-----------")
        
    }
    
}
