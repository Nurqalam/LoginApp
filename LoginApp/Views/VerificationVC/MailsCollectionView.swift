//
//  MailsCollectionView.swift
//  LoginApp
//
//  Created by Nurqalam on 11.04.2022.
//

import Foundation
import UIKit

protocol SelectProposedMailProtocol: AnyObject {
    func selectProposedMail(indexPath: IndexPath)
}

enum IdCell: String {
    case idMailCell
}

class MailsCollectionView: UICollectionView {
    
    weak var selectMailDelegate: SelectProposedMailProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(MailCollectionViewCell.self, forCellWithReuseIdentifier: IdCell.idMailCell.rawValue)
        delegate = self
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
    }
}

//MARK: - UICollectionViewDelegate

extension MailsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMailDelegate?.selectProposedMail(indexPath: indexPath)
    }
}

extension MailsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 5,
               height: 40)
    }
}
