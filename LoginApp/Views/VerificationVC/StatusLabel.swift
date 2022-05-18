//
//  StatusLabel.swift
//  LoginApp
//
//  Created by Nurqalam on 07.04.2022.
//

import Foundation
import UIKit

class StatusLabel: UILabel  {
    
    public var isValid = false {
        didSet {
            if self.isValid {
                setValidSetting()
            } else {
                setNotValidSetting()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Check ur email status"
        textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        font = UIFont(name: "Apple SD Gothic Neo", size: 18)
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
    }

    private func setNotValidSetting() {
        text = "Mail is not valid. Example: name@domain.ru"
        textColor = #colorLiteral(red: 0.9418043095, green: 0.2004035299, blue: 0.09429308964, alpha: 1)
    }
    
    private func setValidSetting() {
        text = "Mail is valid."
        textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }

    public func setDefaultSetting() {
        configure()
    }
}
