//
//  TexfieldUnderLineDesign.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/07.
//

import UIKit

class TexfieldUnderLineDesign: UITextField{
    self.borderStyle = .none
            let border = CALayer()
            border?.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.width, height: 1)
            border?.backgroundColor = UIColor.white.cgColor
            self.layer.addSublayer((border)!)
            self.textAlignment = .center
            self.textColor = UIColor.white
}
