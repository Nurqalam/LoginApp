//
//  StatusLabel.swift
//  LoginApp
//
//  Created by Nurqalam on 07.04.2022.
//

import Foundation
import UIKit

class StatusLabel: UILabel  {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Check ur mail"
        textColor = #colorLiteral(red: 0.717387421, green: 0.4762157365, blue: 0.09534761139, alpha: 1)
        font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
