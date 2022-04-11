//
//  UIStackViewExtensions.swift
//  LoginApp
//
//  Created by Nurqalam on 10.04.2022.
//

import Foundation
import UIKit


extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
