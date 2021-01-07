//
//  WritingPetitionViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/16.
//

import UIKit
import FirebaseFirestore

var a: Int = 0

var petitiontitleList: [String]! = []
var petitioncontentList: [String]! = []

// 찬성 수, 반대 수
var agreementNumber: [Int]! = []
var oppositionNumber: [Int]! = []

// 투표 여부
var agreementSelected: [Bool]! = []
var oppositionSelected: [Bool]! = []


var newPetitionArrayNumber: Int = 0

var arrayIndex: Int! = 0

protocol WritingPetitionDelegate: class {
    func submitBtn(title: String, content: String, petitionStartedDate: [String]!, petitionFinishedDate: [String]!, agreementNumber: [Int]!, oppositionNumber: [Int]!, agreementSelected: [Bool]!, oppositionSelected: [Bool]!, arrayIndex: Int!)
}

class WritingPetitionViewController: UIViewController {
    let db = Firestore.firestore()
    
    // 청원 시작, 마감 날짜
    var petitionStartedDateArray: [String]! = []
    var petitionFinishedDateArray: [String]! = []
    weak var delegate: WritingPetitionDelegate?
    
    // 청원 제목 텍스트필드
    @IBOutlet weak var petitionTitleTextfield: UITextField!
    
    // 청원 내용 텍스트뷰
    @IBOutlet weak var petitionContentTextView: UITextView!
    
    // 청원 제출 버튼 아울렛
    @IBOutlet weak var petitionSubmitBtnOutlet: UIButton!
    


    
    // 청원 내용을 담아 상위 뷰컨으로 보낼 변수
    var petitionContent: String!
    var petitionTitle: String!
    



    
    let UnWrittenWarning = UIAlertController(title: "경고", message: "제목과 내용 중 입력하지 않은 부분이 있습니다.", preferredStyle: UIAlertController.Style.alert)
    let write = UIAlertAction(title: "입력하기", style: UIAlertAction.Style.default, handler: nil)
    
    let submitWarning = UIAlertController(title: "경고", message: "청원을 제출하시면 삭제할 수 없습니다. 제출하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
    let submitCancle = UIAlertAction(title: "취소", style: .destructive, handler: nil)
    lazy var submit = UIAlertAction(title: "제출", style: .destructive, handler: { _ in self.dismiss(animated: true, completion: nil)})
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UnWrittenWarning.addAction(write)
        submitWarning.addAction(submitCancle)
        submitWarning.addAction(submit)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    // 청원 제출 버튼
    @IBAction func petitionSubmitBtn(_ sender: UIButton) {
        print(petitionTitleTextfield.text?.isEmpty as Any)

        // 비어있으면
        if((petitionTitleTextfield.text?.isEmpty) != false || (petitionContentTextView.text?.isEmpty) != false){
            present(UnWrittenWarning, animated: true, completion: nil)
        }else{ // 다 있으면
            

            
            
            print("청원 쓴 후 array Index : \(arrayIndex)")


            
            self.dismiss(animated: true, completion: nil)
            
            newPetitionArrayNumber = petitiontitleList.count

            
            // 배열에 값 넣기
            petitiontitleList.append("\(String(describing: petitionTitleTextfield.text!))")
            petitioncontentList.append("\(String(describing: petitionContentTextView.text!))")

            // 청원 시작, 마감 날짜 배열에 저장하기
            petitionStartedDateArray.append(getCurrentDate())
            petitionFinishedDateArray.append(finishDate())
            print("청원시작배열 count \(petitionStartedDateArray.count)")
            print("청원마감배열 count \(petitionFinishedDateArray.count)")
            
            print("청원 시작 날짜 : \(String(describing: petitionStartedDateArray))")
            print("청원 마감 날짜 : \(String(describing: petitionFinishedDateArray))")
            
            print("title : \(petitiontitleList as Any)")
            print("content : \(petitioncontentList as Any)")
            


            

            
            petitionTitle = petitionTitleTextfield.text
            petitionContent = petitionContentTextView.text
            
            // 보내기
            delegate?.submitBtn(title: petitionTitle, content: petitionContent, petitionStartedDate: petitionStartedDateArray, petitionFinishedDate: petitionFinishedDateArray, agreementNumber:agreementNumber, oppositionNumber: oppositionNumber, agreementSelected: agreementSelected, oppositionSelected: oppositionSelected , arrayIndex: arrayIndex)
            
            arrayIndex = arrayIndex + 1
            
            // 화면 전환
            self.navigationController?.popViewController(animated: true)
            
            print("---------------")

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
    func finishDate() -> String{
        let today = Date()
        let todayFormatter = DateFormatter()
        todayFormatter.locale = Locale(identifier: "ko")
        todayFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = todayFormatter.string(from: Date())
        let finishFormatter = DateFormatter()
        let finishday = Calendar.current.date(byAdding: .day, value: 30, to: today)
        finishFormatter.locale = Locale(identifier: "ko")
        finishFormatter.dateFormat = "yyyy-MM-dd"
        let finishDate = finishFormatter.string(from: finishday!)

        return finishDate
        
    }
}


