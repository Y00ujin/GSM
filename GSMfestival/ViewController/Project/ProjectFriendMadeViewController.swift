//
//  ProjectFriendMadeViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/12.
//

import UIKit


extension ProjectFriendMadeViewController: AddStudentsDelegate {
    func submitBtn(name: String, number: String, discordId: String, selectedField: String){
        ios[0] = "이름 : \(name), 학번 : \(number), 아이디 : \(discordId), 전공 : \(selectedField)"
    }
    
}


class ProjectFriendMadeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.ios.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let text: String = self.ios[indexPath.row]
        cell.textLabel?.text = text
        
        return cell
    }
    
    var name: String = ""
    var number: String = ""
    var discordId: String = ""
    var selectedField: String = ""
        
    @IBOutlet weak var tableView: UITableView!
    
    var ios: [String] = ["1403 김유진","2","3","4","5"]
    var android: [String] = ["김대영", "정민혁"]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  vc = segue.destination as? AddStudentsViewController {
            vc.delegate = self
        }
    }
    

    @IBOutlet weak var showdetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var AppAppear: Bool = true
    var iosAppear: Bool = true
    var AndroidAppear: Bool = true
    var WebAppear: Bool = true
    var IosAppear: Bool = true
    var IotAppear: Bool = true
    
    // Ios button
    @IBOutlet weak var IosBtnOutlet: UIButton!
    
    // Ios 하위 button
    @IBOutlet weak var IosStoryboardBtnOutlet: UIButton!
    @IBOutlet weak var IosSwiftUiBtnOutlet: UIButton!
    
    // Android button
    @IBOutlet weak var AndroidBtnOutlet: UIButton!
    
    // Web button
    @IBOutlet weak var WebBtnOutlet: UIButton!
    
    // Web 하위 button
    @IBOutlet weak var WebFrontendBtnOutlet: UIButton!
    @IBOutlet weak var WebBackendBtnOutlet: UIButton!
    
    // Iot button
    @IBOutlet weak var IotBtnOutlet: UIButton!
    
    // Iot 하위 button
    @IBOutlet weak var IotRaspberryPi: UIButton!
    @IBOutlet weak var IotArduino: UIButton!
    
    @IBAction func AppBtn(_ sender: Any) {
        if(AppAppear == true){
            // App 누르면 ios, androoid 나오게 하는 부분
            buttonAppear(button: IosBtnOutlet, ButtonName: "IOS")
            buttonAppear(button: AndroidBtnOutlet, ButtonName: "Android")
            AppAppear = false
        }
        else{
            // 다시 누르면 ios, androoid 버튼이 없어지는 부분
            buttonDisappear(button: IosBtnOutlet)
            buttonDisappear(button: AndroidBtnOutlet)

            
            // Ios의 하위 버튼들도 함께 없어지는 부분
            buttonDisappear(button: IosStoryboardBtnOutlet)
            buttonDisappear(button: IosSwiftUiBtnOutlet)
            AppAppear = true
        }
        
        if(WebAppear == false){
            // web 하위 버튼들이 보여지고 있다면 안 보이게 하는 부분
            buttonDisappear(button: WebFrontendBtnOutlet)
            buttonDisappear(button: WebBackendBtnOutlet)
            WebAppear = true
        }
        
        if(IotAppear == false){
            // Iot 하위 버튼들이 보여지고 있다면 안 보이게 하는 부분
            buttonDisappear(button: IotRaspberryPi)
            buttonDisappear(button: IotArduino)
            IotAppear = true
        }
    }
    

    @IBAction func IosBtn(_ sender: Any) {

            if(iosAppear == true){
                // Ios버튼 누르면 storyboard, swiftui
                buttonAppear(button: IosStoryboardBtnOutlet, ButtonName: "Storyboard")
                buttonAppear(button: IosSwiftUiBtnOutlet, ButtonName: "swiftUI")
                iosAppear = false
            }
            else{
                // 다시 누르면 ios, androoid 버튼이 없어지는 부분
                buttonDisappear(button: IosStoryboardBtnOutlet)
                buttonDisappear(button: IosSwiftUiBtnOutlet)
                iosAppear = true
            }
        
        if(selectedField == "IOS"){
            
        }

    }
    
    @IBAction func IosStoryboardBtn(_ sender: Any) {
        
    }
    
    
    @IBAction func AndroidBtn(_ sender: Any) {
        
    }
    
    @IBAction func WebBtn(_ sender: Any) {
        if(WebAppear == true){
            // Ios버튼 누르면 storyboard, swiftui
            buttonAppear(button: WebFrontendBtnOutlet, ButtonName: "frontend")
            buttonAppear(button: WebBackendBtnOutlet, ButtonName: "backend")
            WebAppear = false
        }
        else{
            // 다시 누르면 ios, androoid 버튼이 없어지는 부분
            buttonDisappear(button: WebFrontendBtnOutlet)
            buttonDisappear(button: WebBackendBtnOutlet)
            WebAppear = true
        }
        
        if(AppAppear == false){
            // app 하위 버튼들이 보여지고있다면 안 보이게 하는 부분
            buttonDisappear(button: IosBtnOutlet)
            buttonDisappear(button: AndroidBtnOutlet)
            AppAppear = true

            if(iosAppear == false){
                // ios 하위 버튼들이 보여지고있다면 안 보이게 하는 부분
                buttonDisappear(button: IosStoryboardBtnOutlet)
                buttonDisappear(button: IosSwiftUiBtnOutlet)
                iosAppear = true
            }
        }
        
        if(IotAppear == false){
            // Iot 하위 버튼들이 보여지고 있다면 안 보이게 하는 부분
            buttonDisappear(button: IotRaspberryPi)
            buttonDisappear(button: IotArduino)
            IotAppear = true
        }
    }
    
    @IBAction func IotBtn(_ sender: Any) {
        if(IotAppear == true){
            // Ios버튼 누르면 storyboard, swiftui
            buttonAppear(button: IotRaspberryPi, ButtonName: "RaspberryPi")
            buttonAppear(button: IotArduino, ButtonName: "Arduino")
            IotAppear = false
        }
        else{
            // 다시 누르면 ios, androoid 버튼이 없어지는 부분
            buttonDisappear(button: IotRaspberryPi)
            buttonDisappear(button: IotArduino)
            IotAppear = true
        }
        
        if(WebAppear == false){
            // web 하위 버튼들이 보여지고 있다면 안 보이게 하는 부분
            buttonDisappear(button: WebFrontendBtnOutlet)
            buttonDisappear(button: WebBackendBtnOutlet)
            WebAppear = true
        }
        
        if(AppAppear == false){
            // app 하위 버튼들이 보여지고있다면 안 보이게 하는 부분
            buttonDisappear(button: IosBtnOutlet)
            buttonDisappear(button: AndroidBtnOutlet)
            AppAppear = true

            if(iosAppear == false){
                // ios 하위 버튼들이 보여지고있다면 안 보이게 하는 부분
                buttonDisappear(button: IosStoryboardBtnOutlet)
                buttonDisappear(button: IosSwiftUiBtnOutlet)
                iosAppear = true
            }
        }
    }
    
    func buttonDisappear(button: UIButton){
        button.backgroundColor = UIColor.clear
        button.setTitle("", for: .normal)
    }
    
    func buttonAppear(button: UIButton, ButtonName: String){
        button.backgroundColor = UIColor.darkGray
        button.setTitle(ButtonName, for: .normal)
    }
    
}
