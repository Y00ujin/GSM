//
//  TextfieldGrayBoxDesign.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/08.
//

import UIKit

class TextfieldGrayBoxDesign: UITextField {
    override func awakeFromNib() {
        self.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        self.clipsToBounds = true
        self.layer.cornerRadius = 20.0;
        self.layer.shadowOffset = CGSize(width: 0, height: 2) // 위치조정
        self.layer.shadowRadius = 5 // 반경
        self.layer.shadowColor = CGColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        self.layer.shadowOpacity = 0.3 // alpha값
        
    }
}
