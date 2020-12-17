//
//  SchoolMealsViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/17.
//

import UIKit
import Alamofire



class SchoolMealsViewController: UIViewController{
    @IBOutlet weak var schoolMealContentLabel: UILabel!
    @IBOutlet weak var schoolMealDateLabel: UILabel!
    @IBOutlet weak var schoolMealTimeLabel: UILabel!
    @IBOutlet weak var breakfastBtn: UIButton!
    @IBOutlet weak var lunchBtn: ShortButtonDesign!
    @IBOutlet weak var dinnerBtn: ShortButtonDesign!
    @IBOutlet weak var tabbarShadowView: UIView!
    
    @IBOutlet weak var profileButton: UIButton!
    var currentTimeInt: Int = 0
    var currentDateInt: Int = 0
    
    let formatter = DateFormatter()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentDate()
        
        profileButton.contentVerticalAlignment = .fill
        profileButton.contentHorizontalAlignment = .fill
        profileButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        schoolMealDateLabel.isHidden = true
        schoolMealTimeLabel.isHidden = true

        print("현재날짜 : "+(getCurrentDate()))
        print("현재시각 : "+(getCurrentTime()))
        
        if(currentTimeInt >= 19){ // 석식 후에는 다음 날의 아침이 나오게
            lunchBtn.setTitleColor(.gray, for: .normal)
            dinnerBtn.setTitleColor(.gray, for: .normal)
            breakfastBtn.setTitleColor(.white, for: .normal)
            BlueButton(button: breakfastBtn)
            LineButton(button: lunchBtn)
            LineButton(button: dinnerBtn)
            apiCall(schoolMealCode: "1", schoolMealDate: getCurrentDate())
        } else if(currentTimeInt <= 12){ // 점심
            breakfastBtn.setTitleColor(.gray, for: .normal)
            dinnerBtn.setTitleColor(.gray, for: .normal)
            lunchBtn.setTitleColor(.white, for: .normal)

            BlueButton(button: lunchBtn)
            LineButton(button: breakfastBtn)
            LineButton(button: dinnerBtn)
            apiCall(schoolMealCode: "2", schoolMealDate: getCurrentDate())
        } else if(currentTimeInt >= 12){
            lunchBtn.setTitleColor(.gray, for: .normal)
            breakfastBtn.setTitleColor(.gray, for: .normal)
            dinnerBtn.setTitleColor(.white, for: .normal)
            BlueButton(button: dinnerBtn)
            LineButton(button: breakfastBtn)
            LineButton(button: lunchBtn)
            apiCall(schoolMealCode: "3", schoolMealDate: getCurrentDate())
        }
    }
    // 아침을 누르면 조식
    @IBAction func schoolMealBreakfastBtn(_ sender: Any) {
        lunchBtn.setTitleColor(.gray, for: .normal)
        dinnerBtn.setTitleColor(.gray, for: .normal)
        breakfastBtn.setTitleColor(.white, for: .normal)
        BlueButton(button: breakfastBtn)
        LineButton(button: lunchBtn)
        LineButton(button: dinnerBtn)
        apiCall(schoolMealCode: "1", schoolMealDate: getCurrentDate())
    }
    
    // 점심을 누르면 중식
    @IBAction func schoolMealLunchBtn(_ sender: Any) {        breakfastBtn.setTitleColor(.gray, for: .normal)
        dinnerBtn.setTitleColor(.gray, for: .normal)
        lunchBtn.setTitleColor(.white, for: .normal)
        BlueButton(button: lunchBtn)
        LineButton(button: breakfastBtn)
        LineButton(button: dinnerBtn)
        apiCall(schoolMealCode: "2", schoolMealDate: getCurrentDate())
    }
    
    // 저녁을 누르면 석식
    @IBAction func schoolMealDinner(_ sender: Any) { // -> 여기는 현재 날짜 변수 넣기
        lunchBtn.setTitleColor(.gray, for: .normal)
        breakfastBtn.setTitleColor(.gray, for: .normal)
        dinnerBtn.setTitleColor(.white, for: .normal)
        BlueButton(button: dinnerBtn)
        LineButton(button: breakfastBtn)
        LineButton(button: lunchBtn)
        apiCall(schoolMealCode: "3", schoolMealDate: getCurrentDate())
    }
    
    
    
    func getCurrentDate() -> String{
        let today = Date()
        let todayFormatter = DateFormatter()
        todayFormatter.locale = Locale(identifier: "ko")
        todayFormatter.dateFormat = "yyyyMMdd"
        let currentDate = todayFormatter.string(from: Date())
        let tomorrowFormatter = DateFormatter()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)
        tomorrowFormatter.locale = Locale(identifier: "ko")
        tomorrowFormatter.dateFormat = "yyyyMMdd"
        let tomorrowDate = tomorrowFormatter.string(from: tomorrow!)
        print("tomorrow : \(tomorrow)")
        print("내일 날짜 : \(tomorrowDate)")
        if(currentTimeInt >= 19){
            return tomorrowDate
        } else{
            return currentDate
        }
    }
    
    func getCurrentTime() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        formatter.timeZone = TimeZone.autoupdatingCurrent
        formatter.locale = Locale.current
        let currentTime = formatter.string(from: Date())
        currentTimeInt = Int(currentTime) ?? 0
        return currentTime
    }
    
    
    func apiCall(schoolMealCode: String, schoolMealDate: String){
        _ = "https://open.neis.go.kr/hub/mealServiceDietInfo"
        _ = mealRequest(key: "9bcd0e222d484008aee667a992293fd0", requestType: "json", pageIndex: 1, pageSize: 100, schoolRegionCode: "F10", schoolCode: "7380292", schoolMealCode: schoolMealCode, schoolMealDate: schoolMealDate)
        AF.request("https://open.neis.go.kr/hub/mealServiceDietInfo", method: .get, parameters: mealRequest(key: "9bcd0e222d484008aee667a992293fd0", requestType: "json", pageIndex: 1, pageSize: 100, schoolRegionCode: "F10", schoolCode: "7380292", schoolMealCode: schoolMealCode, schoolMealDate: schoolMealDate), encoder: URLEncodedFormParameterEncoder.default).response { [self] response in
                    if response.error != nil {
                        //에러상황
                        debugPrint(response.error?.errorDescription as Any)
                    }
                    debugPrint(response)
            
            // 디코딩
            guard let data = response.data else { return }
            
            let schoolMealResponse = try? JSONDecoder().decode(mealResponse.self, from: data)
            
            schoolMealContentLabel.text =  schoolMealResponse?.mealServiceDietInfo[1].row?.first?.dishName
            
            schoolMealDateLabel.text = schoolMealResponse?.mealServiceDietInfo[1].row?.first?.schoolMealDate
            
            schoolMealTimeLabel.text = schoolMealResponse?.mealServiceDietInfo[1].row?.first?.schoolMealTime
            
            // schoolMealContent 예쁘게 바꾸기
            let schoolMealContentResultArray = schoolMealContentLabel.text?.splitContent().map { $0.removeNutrientInfo() }

            
            // 배열 원소를 하나로 합쳐서 넣기
            let schoolMealContentResult = schoolMealContentResultArray?.joined(separator: "\n")

            schoolMealContentLabel.text = schoolMealContentResult

        }
    }
    
    
    func BlueButton(button: UIButton) {
        button.layer.cornerRadius = 15.0;
        button.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        button.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        button.layer.shadowRadius = 5 // 반경
        button.layer.shadowColor = CGColor(red: 37/255, green: 94/255, blue: 141/255, alpha: 1)
        button.layer.shadowOpacity = 0.3 // alphabutton
        button.backgroundColor = UIColor(red: 37/255, green: 94/255, blue: 141/255, alpha: 1)
        button.tintColor = UIColor.white
    }
    
    func LineButton(button: UIButton) {
        button.layer.cornerRadius = 15.0;
        button.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        button.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        button.layer.shadowRadius = 5 // 반경
        button.layer.shadowColor = CGColor(red: 37/255, green: 94/255, blue: 141/255, alpha: 1)
        button.layer.shadowOpacity = 0.3 // alphabutton
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor(red: 37/255, green: 94/255, blue: 141/255, alpha: 1)
        button.backgroundColor = .white
        button.tintColor = UIColor.white
    }
}

// 급식 내용을 예쁘게 바꿔줘요
private extension String {
    func splitContent() -> [String] {
        return replacingOccurrences(of: "<br/>", with: ">")
            .split(separator: ">")
            .map { String($0) }
    }
    
    func removeNutrientInfo() -> String {
        removeStarPoint().removeSlashPoint().removeDotPoint()
    }
    
    private func removeStarPoint() -> String {
        if let starIndex = firstIndex(of: "*")?.utf16Offset(in: self) {
            return String(prefix(starIndex))
        }
        return self
    }
    
    private func removeSlashPoint() -> String {
            if let slashIndex = firstIndex(of: "/") {
                let nextIndex = index(after: slashIndex)
                if nextIndex.utf16Offset(in: self) < count {
                    if !self[nextIndex].isLetter {
                        return String(prefix(slashIndex.utf16Offset(in: self)))
                    }
                } else {
                    return String(prefix(slashIndex.utf16Offset(in: self)))
                }
            }
            return self
        }
    
    private func removeDotPoint() -> String {
        if let dotIndex = firstIndex(of: ".") {
            let prevIndex = index(before: dotIndex)
            if self[prevIndex].isNumber {
                return String(prefix(prevIndex.utf16Offset(in: self)))
            } else {
                return String(prefix(dotIndex.utf16Offset(in: self)))
            }
        }
        return self
    }

}

