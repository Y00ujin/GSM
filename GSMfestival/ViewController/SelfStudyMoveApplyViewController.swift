//
//  SelfStudyMoveApplyViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/12.
//

import UIKit

class SelfStudyMoveApplyViewController:  UIViewController{
    // 텍필view에서 버튼view로 돌아가는 버튼
    @IBOutlet weak var backToBtnViewBtn: UIButton!
    
    // 다른장소입력 view
    @IBOutlet weak var MovePlaceTextFieldView: UIView!
    
    // 버튼 회색 박스 view
    @IBOutlet weak var MovePlaceBtnView: UIView!
    
    // 이동장소 버튼 view
    @IBOutlet weak var MovePlaceBtnChooseView: UIView!
    
    // 다른 장소 입력 Textfield
    @IBOutlet weak var OtherPlaceTextField: UITextField!
    
    // 다른 장소 입력 버튼
    @IBOutlet weak var OtherPlaceBtn: UIButton!
    
    // 다른
    @IBOutlet weak var OtherPlaceSubmitBtn: buttonDesign!
    
    // 이동사유 텍스트 필드
    @IBOutlet weak var MoveReasonWriteTextField: UITextField!
    
    var moveReasonWriteTextFieldSituation: String = "Notwritten"
    
    // 취소 뷰
    @IBOutlet weak var MoveCancleView: WhiteBoxViewDesign!
    
    // 이동기록 라벨
    @IBOutlet weak var moveReacoderLabel: UILabel!
    
    // 장소 선택하고 사유 제출하는 뷰
    @IBOutlet weak var MoveChooseView: UIView!
    
    // 화장실 홈베 btn outlet
    @IBOutlet weak var ToiletBtnOutlet: UIButton!
    @IBOutlet weak var HomebaseBtnOutlet: UIButton!
    
    // 층별 Toiiet
    @IBOutlet weak var ToiletSecondFloor: UIButton!
    @IBOutlet weak var ToiletThirdFloor: UIButton!
    @IBOutlet weak var ToiletFourFloor: UIButton!
    
    // 층별 Homebase
    @IBOutlet weak var HomebaseSecondFloor: UIButton!
    @IBOutlet weak var HomebaseThirdFloor: UIButton!
    @IBOutlet weak var HomebaseFourFloor: UIButton!

    // 장소 다시 선택
    @IBOutlet weak var PlaceChooseAgainBtn: UIButton!
    
    // 이동 취소 버튼 Outlet
    @IBOutlet weak var MoveCancelBtnOutlet: UIButton!
    
    // 텍스트필드 위에 장소 라벨
    @IBOutlet weak var WillMovePlaceLabel: UILabel!
    
    // 이동 사유 제출
    @IBOutlet weak var MoveReasonSubmitBtnOutlet: UIButton!
    
    // 장소를 고른 후
    @IBOutlet weak var AfterChoosePlace: UIView!
    
    // 유저 이름
    let userName = UIDevice.current.name
    
    // 일시적 저장 변수
    var MovePlace: UILabel!
    var MyMoveReason: UILabel!
    
    // 버튼 세부사항표기 깃발
    var ToiletAppear: Bool = true
    var HomebaseAppear: Bool = true
    
    var willMovePlaceLabelSituation: String = "Notselected"
    
    let unselectedWarning = UIAlertController(title: "경고", message: "이동장소를 선택하지 않았습니다.", preferredStyle: UIAlertController.Style.alert)
    let selectPlace = UIAlertAction(title: "장소 선택하기", style: UIAlertAction.Style.default, handler: nil)

    
    let unwrittenWarning = UIAlertController(title: "경고", message: "이동사유를 작성하지 않았습니다.", preferredStyle: UIAlertController.Style.alert)
    let writeMoveReason = UIAlertAction(title: "이동사유 작성하기", style: UIAlertAction.Style.default, handler: nil)
    
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AfterChoosePlace.isHidden = true
        MoveCancleView.isHidden = true
        MovePlaceTextFieldView.isHidden = true
        AllButtonDisappearWithOutTopBtn()
        PlaceChooseAgainBtn.isHidden = true
        MoveCancelBtnOutlet.isHidden = true
        willMovePlaceLabelSituation = "Notselected"
        moveReasonWriteTextFieldSituation = "Notwritten"
        unwrittenWarning.addAction(writeMoveReason)
        unselectedWarning.addAction(selectPlace)
        
        profileButton.contentVerticalAlignment = .fill
        profileButton.contentHorizontalAlignment = .fill
        profileButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if(MoveReasonWriteTextField != nil){
            moveReasonWriteTextFieldSituation = "written"
        }
        
        if(WillMovePlaceLabel.text != nil){
            willMovePlaceLabelSituation = "selected"
        }
    }
    
    // 화면 클릭하면 키보드가 내려가는 부분
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }

    
    // 2층 화장실 클릭
    @IBAction func ToiletSecondFloorBtn(_ sender: Any) {
        MovePlaceBtnChooseView.isHidden = true
        MovePlaceBtnView.isHidden = true
        
        AfterChoosePlace.isHidden = false
        WillMovePlaceLabel.text = "2층 화장실"
        MoveReasonWriteTextField.isHidden = false
        MoveReasonSubmitBtnOutlet.isHidden = false
        AllButtonDisappear()
        PlaceChooseAgainBtn.isHidden = false
        OtherPlaceBtn.isHidden = true
        buttonDisappear(button: OtherPlaceBtn)
        
    }
    
    @IBAction func ToiletThirdFloorBtn(_ sender: Any) {
        MovePlaceBtnChooseView.isHidden = true
        WillMovePlaceLabel.isHidden = false
        AfterChoosePlace.isHidden = false
        WillMovePlaceLabel.text = "3층 화장실"
        MoveReasonWriteTextField.isHidden = false
        MoveReasonSubmitBtnOutlet.isHidden = false
        AllButtonDisappear()
        PlaceChooseAgainBtn.isHidden = false
        OtherPlaceBtn.isHidden = true
        buttonDisappear(button: OtherPlaceBtn)

    }
    
    @IBAction func ToiletFourFloorBtn(_ sender: Any) {
        MovePlaceBtnChooseView.isHidden = true
        WillMovePlaceLabel.isHidden = false
        AfterChoosePlace.isHidden = false
        WillMovePlaceLabel.text = "4층 화장실"
        MoveReasonWriteTextField.isHidden = false
        MoveReasonSubmitBtnOutlet.isHidden = false
        AllButtonDisappear()
        PlaceChooseAgainBtn.isHidden = false
        OtherPlaceBtn.isHidden = true
        buttonDisappear(button: OtherPlaceBtn)

    }
    @IBAction func HomebaseSecondFloorBtn(_ sender: Any) {
        MovePlaceBtnChooseView.isHidden = true
        WillMovePlaceLabel.isHidden = false
        AfterChoosePlace.isHidden = false
        WillMovePlaceLabel.text = "2층 홈베이스"
        MoveReasonWriteTextField.isHidden = false
        MoveReasonSubmitBtnOutlet.isHidden = false
        AllButtonDisappear()
        PlaceChooseAgainBtn.isHidden = false
        buttonDisappear(button: OtherPlaceBtn)
        OtherPlaceBtn.isHidden = true

    }
    
    @IBAction func HomebaseThirdFloorBtn(_ sender: Any) {
        MovePlaceBtnChooseView.isHidden = true
        WillMovePlaceLabel.isHidden = false
        AfterChoosePlace.isHidden = false
        WillMovePlaceLabel.text = "3층 홈베이스"
        MoveReasonWriteTextField.isHidden = false
        MoveReasonSubmitBtnOutlet.isHidden = false
        AllButtonDisappear()
        PlaceChooseAgainBtn.isHidden = false
        buttonDisappear(button: OtherPlaceBtn)
        OtherPlaceBtn.isHidden = true

    }
    
    @IBAction func HomebaseFourFloorBtn(_ sender: Any) {
        MovePlaceBtnChooseView.isHidden = true
        WillMovePlaceLabel.isHidden = false
        AfterChoosePlace.isHidden = false
        WillMovePlaceLabel.text = "4층 홈베이스"
        MoveReasonWriteTextField.isHidden = false
        MoveReasonSubmitBtnOutlet.isHidden = false
        AllButtonDisappear()
        PlaceChooseAgainBtn.isHidden = false
        buttonDisappear(button: OtherPlaceBtn)
        OtherPlaceBtn.isHidden = true

    }
    
    
    // 텍필뷰에서 버튼뷰로 돌아가는 버튼
    @IBAction func backToBtnViewBtn(_ sender: Any) {
        MovePlaceTextFieldView.isHidden = true
        MoveCancleView.isHidden = true
        AfterChoosePlace.isHidden = true
        MovePlaceBtnChooseView.isHidden = false
        MovePlaceBtnView.isHidden = false
        OtherPlaceBtn.isHidden = false
    }
    
    // 텍필 완료
    @IBAction func OtherPlaceTextFieldSubmit(_ sender: Any) {
        WillMovePlaceLabel.text = OtherPlaceTextField.text
        MovePlaceTextFieldView.isHidden = true
        backToBtnViewBtn.isHidden = true
        MoveReasonWriteTextField.isHidden = false
        MoveReasonSubmitBtnOutlet.isHidden = false
        PlaceChooseAgainBtn.isHidden = false
        WillMovePlaceLabel.isHidden = false
        AfterChoosePlace.isHidden = false
    }
    
    // 다른 장소 입력 버튼
    @IBAction func otherPlaceMoveBtn(_ sender: Any) {
        MovePlaceBtnView.isHidden = true
        AfterChoosePlace.isHidden = true
        MovePlaceBtnChooseView.isHidden = true
        MoveCancleView.isHidden = true
        MovePlaceTextFieldView.isHidden = false
        
        OtherPlaceBtn.isHidden = true
        backToBtnViewBtn.isHidden = false
        OtherPlaceTextField.text = ""
    }
    
    
    // 장소 다시 선택 클릭
    @IBAction func PlaceChooseAgainBtn(_ sender: Any) {
        MovePlaceBtnChooseView.isHidden = false
        MovePlaceBtnView.isHidden = false
        AfterChoosePlace.isHidden = true
        ToiletBtnOutlet.isHidden = false
        HomebaseBtnOutlet.isHidden = false
        OtherPlaceBtn.isHidden = false
        PlaceChooseAgainBtn.isHidden = true
        WillMovePlaceLabel.isHidden = true
        MoveReasonWriteTextField.text = ""
        WillMovePlaceLabel.text = ""
    }
    
    // 이동사유 제출 버튼 클릭
    @IBAction func MoveReasonSubmitBtn(_ sender: Any) {
        // 이동사유를 쓰지 않고 제출버튼을 눌렀을 때 경고 창
        
        if(WillMovePlaceLabel.text?.isEmpty == true){
            // 장소가 선택되지 않았다면
            present(unselectedWarning, animated: true, completion: nil)
        }else if(MoveReasonWriteTextField.text?.isEmpty == true){
            // 이동사유가 안 적혀있다면
            present(unwrittenWarning, animated: true, completion: nil)
        }else{ // 장소가 선택되었고 이동사유도 적었다면
            AfterChoosePlace.isHidden = true
            MovePlaceBtnChooseView.isHidden = true
            MovePlaceTextFieldView.isHidden = true
            MoveCancleView.isHidden = false
            moveReacoderLabel.isHidden = false
            moveReacoderLabel.text = "이동장소 : \(WillMovePlaceLabel.text ?? "오류") | 이동사유 : \(MoveReasonWriteTextField.text ?? "오류")"
            print(moveReacoderLabel.text!, userName)
            
            // 이동사유 TF 지우기
            MoveReasonWriteTextField.isHidden = true
            
            // 이동 취소 버튼 보이게 하기
            MoveCancelBtnOutlet.isHidden = false
            
            // 다시 장소를 선택하겠습니까? 버튼 없애기
            buttonDisappear(button: PlaceChooseAgainBtn)
            
            // 이동할 장소 라벨 지우기
            labelDisappear(label: WillMovePlaceLabel)
            
            // 이동사유제출 버튼 없애기
            buttonDisappear(button: MoveReasonSubmitBtnOutlet)
            
            // 이동할 장소 초기화 시키기
            WillMovePlaceLabel.text = ""
        }
        
        // 이동장소를 선택하지 않고 제출 버튼을 눌렀을 때에 경고 창 띄우기


    }
    
    // 화장실 버튼 클릭
    @IBAction func ToiletPlaceBtn(_ sender: Any) {
        // 화장실 누르면 2,3,4층 화장실버튼이 나오게 하는 부분
        if(ToiletAppear == true){
            ToiletSecondFloor.isHidden = false
            ToiletThirdFloor.isHidden = false
            ToiletFourFloor.isHidden = false
            ToiletAppear = false
        }// 다시 누르면 2,3,4층 화장실버튼이 없어지는 부분
        else{
            ToiletSecondFloor.isHidden = true
            ToiletThirdFloor.isHidden = true
            ToiletFourFloor.isHidden = true
            ToiletAppear = true
        }
        
        // 홈베이스가 열려있다면
        if(HomebaseAppear == false){
            HomebaseSecondFloor.isHidden = true
            HomebaseThirdFloor.isHidden = true
            HomebaseFourFloor.isHidden = true
            HomebaseAppear = true
        }

    }
    
    // 홈베이스 버튼 클릭
    @IBAction func HomebasePlaceBtn(_ sender: Any) {
        // 홈베 누르면 2,3,4층 홈베버튼 나오게 하는 부분
        if(HomebaseAppear == true){
            HomebaseSecondFloor.isHidden = false
            HomebaseThirdFloor.isHidden = false
            HomebaseFourFloor.isHidden = false
            HomebaseAppear = false
        }// 홈베 다시 누르면 2,3,4층 홈베버튼이 없어지는 부분
        else{
            HomebaseSecondFloor.isHidden = true
            HomebaseThirdFloor.isHidden = true
            HomebaseFourFloor.isHidden = true
            HomebaseAppear = true
        }
        
        if(ToiletAppear == false){
            ToiletSecondFloor.isHidden = true
            ToiletThirdFloor.isHidden = true
            ToiletFourFloor.isHidden = true
            ToiletAppear = true
        }
    }
    
    // 이동취소 버튼 클릭
    @IBAction func MoveCancelBtn(_ sender: Any) {
        MovePlaceBtnChooseView.isHidden = false
        labelDisappear(label: moveReacoderLabel)
        MoveReasonWriteTextField.text = ""
        WillMovePlaceLabel.text = ""
        MoveCancleView.isHidden = true
        MovePlaceBtnView.isHidden = false
        OtherPlaceBtn.isHidden = false
        TopButtonAppear()
    }
    
    // 라벨 받아서 안보이게 하기
    func labelDisappear(label: UILabel){
        label.isHidden = true
    }
    
    // 버튼 이름받아서 그 버튼만 안 보이게 하기
    func buttonDisappear(button: UIButton){
        button.isHidden = true
    }
    
    // 버튼 이름받아서 그 버튼만 보이게 하기
    func buttonAppear(button: UIButton, ButtonName: String){
        button.isHidden = false
    }
    
    func TopButtonAppear(){
        ToiletBtnOutlet.isHidden = false
        HomebaseBtnOutlet.isHidden = false
    }
    
    func AllButtonDisappearWithOutTopBtn() {
        ToiletSecondFloor.isHidden = true
        ToiletThirdFloor.isHidden = true
        ToiletFourFloor.isHidden = true
        HomebaseSecondFloor.isHidden = true
        HomebaseThirdFloor.isHidden = true
        HomebaseFourFloor.isHidden = true
    }
    
    // 모든 버튼 안 보이게 하기
    func AllButtonDisappear(){
        ToiletSecondFloor.isHidden = true
        ToiletThirdFloor.isHidden = true
        ToiletFourFloor.isHidden = true
        HomebaseSecondFloor.isHidden = true
        HomebaseThirdFloor.isHidden = true
        HomebaseFourFloor.isHidden = true
        ToiletBtnOutlet.isHidden = true
        HomebaseBtnOutlet.isHidden = true
    }
    
    // 모든 버튼 보이게 하기
    func AllButtonAppear(){
        ToiletSecondFloor.isHidden = false
        ToiletThirdFloor.isHidden = false
        ToiletFourFloor.isHidden = false
        HomebaseSecondFloor.isHidden = false
        HomebaseThirdFloor.isHidden = false
        HomebaseFourFloor.isHidden = false
        ToiletBtnOutlet.isHidden = false
        HomebaseBtnOutlet.isHidden = false
    }
    


    
}
