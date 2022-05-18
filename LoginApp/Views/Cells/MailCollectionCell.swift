//
//  Cells.swift
//  LoginApp
//
//  Created by Nurqalam on 11.04.2022.
//

import Foundation
import UIKit


class MailCollectionViewCell: UICollectionViewCell {
    
    private let domainLabel: UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        
        addSubview(domainLabel)
    }
    
    public func cellConfigure(mailTextName: String) {
        domainLabel.text = mailTextName
    }
}

extension MailCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            domainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
