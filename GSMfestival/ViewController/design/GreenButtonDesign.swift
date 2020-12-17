//
//  GreenButtonDesign.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/14.
//

import UIKit

class GreenButtonDesign: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 20.0;
        self.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        self.layer.shadowOffset = CGSize(width: 0, height: 2) // 위치조정
        self.layer.shadowRadius = 5 // 반경
        self.layer.shadowColor = CGColor(red: 37/255, green: 94/255, blue: 141/255, alpha: 1)
        self.layer.shadowOpacity = 0.3 // alpha값
        self.backgroundColor = UIColor(red: 224/255, green: 226/255, blue: 100/255, alpha: 1)
        self.tintColor = UIColor.darkGray
    }
}
