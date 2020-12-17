//
//  WritingPetitionViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/16.
//

import UIKit
import FirebaseFirestore

var a: Int = 0

var petitiontitleList: [String]!
var petitioncontentList: [String]!

let petitionNumber = ["1","2","3","4","5","6","7","8","9","10"]

protocol WritingPetitionDelegate: class {
    func submitBtn(title: String, content: String)
}



class WritingPetitionViewController: UIViewController{
    let db = Firestore.firestore()
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Document 이름 직접 만들기
        db.collection("청원").document("청원제목").setData([:]) { err in
            if let err = err {
                print(err)
            } else {
                print("Success")
            }
        }

        UnWrittenWarning.addAction(write)
        submitWarning.addAction(submitCancle)
        submitWarning.addAction(submit)


    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    weak var delegate: WritingPetitionDelegate?
    
    // 청원 제목 텍스트필드
    @IBOutlet weak var petitionTitleTextfield: UITextField!
    
    // 청원 내용 텍스트필드
    @IBOutlet weak var petitionContentTextfield: UITextField!
    
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


    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // 청원 제출 버튼
    @IBAction func petitionSubmitBtn(_ sender: UIButton) {
        print(petitionTitleTextfield.text?.isEmpty as Any)

        // 비어있으면
        if((petitionTitleTextfield.text?.isEmpty) != false || (petitionContentTextfield.text?.isEmpty) != false){
            present(UnWrittenWarning, animated: true, completion: nil)
        }else{ // 다 있으면
            self.dismiss(animated: true, completion: nil)
            
            UserDefaults.standard.set(petitiontitleList, forKey: "petitionTitle")
            UserDefaults.standard.set(petitioncontentList, forKey: "petitionContent")
            
            petitionTitle = petitionTitleTextfield.text
            petitionContent = petitionContentTextfield.text
            
            // 보내기
            delegate?.submitBtn(title: petitionTitle, content: petitionContent)
            
            // 화면 전환
            self.navigationController?.popViewController(animated: true)
            
            // 넣기
            petitiontitleList.append(petitionTitle)
            petitioncontentList.append(petitionContent)
            
            print("title : \(petitiontitleList as Any)")
            print("content : \(petitioncontentList as Any)")
        }
    }
}


