//
//  VerificationButton.swift
//  LoginApp
//
//  Created by Nurqalam on 10.04.2022.
//

import Foundation
import UIKit


class VerificationButton: UIButton {
    
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
        backgroundColor = .white
        layer.cornerRadius = 10
        setTitle("Verification", for: .normal)
        let color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setTitleColor(color, for: .normal)
        titleLabel?.font = UIFont(name: "Avenir Book", size: 21)
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSetting() {
        isEnabled = false
        alpha = 0.5
    }
    
    private func setValidSetting() {
        isEnabled = true
        alpha = 1
    }
    
    public func setDefaultSetting() {
        configure()
    }

}
