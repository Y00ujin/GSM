//
//  TextFieldLeftPadding.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/09.
//

import UIKit

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
