//
//  TextfieldLeftPadding.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/10.
//

import UIKit
@IBDesignable
class FormTextField: UITextField {

@IBInspectable var inset: CGFloat = 0

//let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
}

override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
}

override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
}

}
