//
//  AddStudentsViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/23.
//

import UIKit

protocol AddStudentsDelegate: class {
    func submitBtn(name: String, number: String, discordId: String, selectedField: String)
}

class AddStudentsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    weak var delegate: AddStudentsDelegate?
    
    private let pickerViewCellValues: [String] = ["분야를 선택해주세요","IOS","Android","frontend","backend","raspberryPi","arduino","game","Security","Robotics"]
    
    // 이름 텍스트필드
    @IBOutlet weak var nameTextfield: UITextField!
    
    // 학번 텍스트필드
    @IBOutlet weak var NumberTextfield: UITextField!
    
    // 디스코드 아이디 텍스트필드
    @IBOutlet weak var discordIdTextfield: UITextField!
    
    // 상위 뷰로 올릴 변수들
    var name: String = ""
    var number: String = ""
    var discordId: String = ""
    var selectedField: String = ""

    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        picker.frame = CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 180.0)
        
        picker.delegate = self
        picker.dataSource = self
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.pickerView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewCellValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewCellValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(pickerViewCellValues[row])")
        selectedField = pickerViewCellValues[row]
    }
    
    // 제출 버튼
    @IBAction func submitBtn(_ sender: Any) {
        
        if(pickerViewCellValues.isEmpty != false){
            
        }
        
        name = nameTextfield.text!
        number = NumberTextfield.text!
        discordId = discordIdTextfield.text!
        print("선택된 분야 : \(selectedField)")
        print("이름 : \(name)")
        print("학번 : \(number)")
        print("디스코드 아이디 : \(discordId)")
        
        self.navigationController?.popViewController(animated: true)

        delegate?.submitBtn(name: name, number: number, discordId: discordId, selectedField: selectedField)
        

    }

    

}
