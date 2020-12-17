//
//  BrokenPartViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/14.
//

import UIKit

class BrokenPartViewController: UIViewController{
    var BrokenPart: [String] = ["1","2","3","4","5","6"]
    var StoreNum: Int = 0
    
    @IBOutlet weak var profileButton: UIButton!
    var BrokenPartRecoder: [String] = ["1","2","3","4","5","6"]
    
    // 제출하면 표시되는 라벨
    @IBOutlet weak var BrokenPartList: UILabel!
    
    // 세부사항기입 텍스트필드
    @IBOutlet weak var BrokenPartDetailTextField: UITextField!
    
    // 제출
    @IBOutlet weak var submit: UIButton!
    
    // 세부사항작성 view
    @IBOutlet weak var detailTextFieldView: UIView!
    
    // 고쳐졌나요?
    @IBOutlet weak var BrokenPartFixBtnOutlet: UIButton!
    
    // 결과 라벨 나오는 뷰
    @IBOutlet weak var resultView: UIView!
    
    // 장소 버튼 잔뜩있는 뷰
    @IBOutlet weak var choosePlaceView: UIView!
    
    // 화장실
    @IBOutlet weak var toiletButton: UIButton!
    
    // 홈베이스
    @IBOutlet weak var homebaseButton: UIButton!
    
    // 여자 화장실, 남자 화장실 버튼 뷰
    @IBOutlet weak var menWomenToiletButtonView: UIView!
    
    // 남자 화장실 층별 버튼 뷰
    @IBOutlet weak var menToiletButtonView: UIView!
    
    // 여자 화장실 층별 버튼 뷰
    @IBOutlet weak var womenToiletButtonView: UIView!
    
    // 홈베 층별 버튼 뷰
    @IBOutlet weak var homeBaseButtonView: UIView!
    
    // 선택된 라벨
    @IBOutlet weak var selectedPlaceLabel: UILabel!
    
    // 하나 더 건의하기 버튼
    @IBOutlet weak var ApplyAgainButton: UIButton!
    
    // 건의 2 라벨
    @IBOutlet weak var ApplyAgainLabel: UILabel!
    
    var a: Int = 1
    
    var submitAppear: Bool = true
    
    var firstApply: Bool = false

    
    let selectPlace = UIAlertAction(title: "장소 선택하기", style: UIAlertAction.Style.default, handler: nil)
    let unselectedWarning = UIAlertController(title: "경고", message: "이동장소를 선택하지 않았습니다.", preferredStyle: UIAlertController.Style.alert)
    
    // 화면 아무데나 클릭하면 키보드가 내려가는 부분
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.isHidden = true
        detailTextFieldView.isHidden = true
        
        homeBaseButtonView.isHidden = true
        womenToiletButtonView.isHidden = true
        menToiletButtonView.isHidden = true
        menWomenToiletButtonView.isHidden = true
        
        unselectedWarning.addAction(selectPlace)
        profileButton.contentVerticalAlignment = .fill
        profileButton.contentHorizontalAlignment = .fill
        profileButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    // 화장실 버튼
    @IBAction func ToiletButton(_ sender: Any) {
        if(homeBaseButtonView.isHidden == false){
            homeBaseButtonView.isHidden = true
        }
        if(menWomenToiletButtonView.isHidden == false){
            menWomenToiletButtonView.isHidden = true
        }else{
            menWomenToiletButtonView.isHidden = false
        }
    }
    
    // 홈베이스 버튼
    @IBAction func homebaseButton(_ sender: Any) {
        // 여자 또는 남자 화장실 버튼 뷰가 보여지고 있다면
        if(womenToiletButtonView.isHidden == false || menToiletButtonView.isHidden == false){
            womenToiletButtonView.isHidden = true
            menToiletButtonView.isHidden = true
        }
        
        if(menWomenToiletButtonView.isHidden == false){
            menWomenToiletButtonView.isHidden = true
        }
        
        if(homeBaseButtonView.isHidden == false){
            homeBaseButtonView.isHidden = true
        }
        else{
            homeBaseButtonView.isHidden = false
        }
    }
    
    // 여자 화장실 버튼
    @IBAction func WomenToiletButton(_ sender: Any) {
        // 홈베이스 버튼 뷰가 보여지고 있다면 없애버려
        if(homeBaseButtonView.isHidden == false){
            homeBaseButtonView.isHidden = true
        }
        
        // 남자 화장실 버튼 뷰가 보여지고 있다면 업애기
        if(menToiletButtonView.isHidden == false){
            menToiletButtonView.isHidden = true
        }
        
        // 보여지고있을 때 누르면 안 보여지고 안 보일 때 누르면 보여지게
        if(womenToiletButtonView.isHidden == false){
            womenToiletButtonView.isHidden = true
        }
        else{
            womenToiletButtonView.isHidden = false
        }

    }
    
    // 남자 화장실 버튼
    @IBAction func menToiletButton(_ sender: Any) {
        // 홈베이스 버튼 뷰가 보여지고 있다면 없애버려
        if(homeBaseButtonView.isHidden == false){
            homeBaseButtonView.isHidden = true
        }
        
        // 여자 화장실 버튼 뷰가 보여지고 있다면 없애버려
        if(womenToiletButtonView.isHidden == false){
            womenToiletButtonView.isHidden = true
        }
        
        // 보여지고있을 때 누르면 안 보여지고 안 보일 때 누르면 보여지게
        if(menToiletButtonView.isHidden == false){
            menToiletButtonView.isHidden = true
        }else{
            menToiletButtonView.isHidden = false
        }
    }
    
    // 4층 홈베 버튼
    @IBAction func FourHomebaseButton(_ sender: Any) {
        selectedPlaceLabel.text = "4층 홈베이스"
        AfterChoosePlaceViewChange()
    }
    
    // 3층 홈베 버튼
    @IBAction func ThreeHomebaseButton(_ sender: Any) {
        selectedPlaceLabel.text = "3층 홈베이스"
        AfterChoosePlaceViewChange()
    }
    
    // 2층 홈베 버튼
    @IBAction func SecondHomebaseButton(_ sender: Any) {
        selectedPlaceLabel.text = "2층 홈베이스"
        AfterChoosePlaceViewChange()
    }
    
    // 4층 남자화장실
    @IBAction func FourMenToiletButton(_ sender: Any) {
        selectedPlaceLabel.text = "4층 남자화장실"
        AfterChoosePlaceViewChange()
    }
    
    // 3층 남자화장실
    @IBAction func ThreeMenToiletButton(_ sender: Any) {
        selectedPlaceLabel.text = "3층 남자화장실"
        AfterChoosePlaceViewChange()
    }
    
    // 2층 남자화장실
    @IBAction func secondMenToiletButton(_ sender: Any) {
        selectedPlaceLabel.text = "2층 남자화장실"
        AfterChoosePlaceViewChange()
    }
    
    // 4층 여자화장실
    @IBAction func FourWomenToiletButton(_ sender: Any) {
        selectedPlaceLabel.text = "4층 여자화장실"
        AfterChoosePlaceViewChange()
    }
    
    // 3층 여자화장실
    @IBAction func ThreeWomenToiletButton(_ sender: Any) {
        selectedPlaceLabel.text = "3층 여자화장실"
        AfterChoosePlaceViewChange()
    }
    
    // 2층 여자화장실
    @IBAction func SecondMenToiletButton(_ sender: Any) {
        selectedPlaceLabel.text = "2층 여자화장실"
        AfterChoosePlaceViewChange()
    }
    
    
    // 고쳐졌나요??
    @IBAction func BrokenPartFixBtn(_ sender: Any) {
        BrokenPartList.text = ""
        resultView.isHidden = true
        detailTextFieldView.isHidden = true
        choosePlaceView.isHidden = false
        
    }
    
    func AfterChoosePlaceViewChange() {
        choosePlaceView.isHidden = true
        detailTextFieldView.isHidden = false
    }
    
    // 하나 더 건의하기
    @IBAction func ApplyAgainButton(_ sender: Any) {
        resultView.isHidden = true
        detailTextFieldView.isHidden = true
        choosePlaceView.isHidden = false
    }
    
    // 텍필 제출
    @IBAction func BrokenPartDetailSubmitBtn(_ sender: Any) {
        resultView.isHidden = false
        detailTextFieldView.isHidden = true
        choosePlaceView.isHidden = true
        if(firstApply == true){
            ApplyAgainLabel.text = """
                장소 : \(selectedPlaceLabel.text ?? "") \
                세부사항 : \(BrokenPartDetailTextField.text ?? "")
                """
        }else{
            BrokenPartList.text! += """
                장소 : \(selectedPlaceLabel.text ?? "") \
                세부사항 : \(BrokenPartDetailTextField.text ?? "")
                """
        }
    }
}
