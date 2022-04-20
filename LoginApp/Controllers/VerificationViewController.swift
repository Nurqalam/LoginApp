//
//  ViewController.swift
//  LoginApp
//
//  Created by Nurqalam on 07.04.2022.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "backStone")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView = MailsCollectionView(frame: .zero,
                                                     collectionViewLayout: UICollectionViewFlowLayout())
    
    
    private lazy var stackView = UIStackView(arrangedSubviews: [mailTextField,
                                                               verificationButton,
                                                               collectionView],
                                        axis: .vertical,
                                        spacing: 20)
    
    private let verificationModel = VerificationModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
    }
    
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(statusLabel)
        view.addSubview(stackView)
        verificationButton.addTarget(self,
                                     action: #selector(verificationButtonTaped),
                                     for: .touchUpInside)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        mailTextField.textFieldDelegate = self
    }
    
    @objc private func verificationButtonTaped() {
        print("button tapped")
    }
}

//MARK: - UICollectionViewDataSource

extension VerificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        verificationModel.filteredMailArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idMailCell.rawValue,
                                                            for: indexPath) as? MailCollectionCell
        else {
            return UICollectionViewCell()
        }
        
        let mailLabelText = verificationModel.filteredMailArray[indexPath.row]
        cell.cellConfigure(mailLabelText: mailLabelText)
        return cell
    }
}


//MARK: - SelectProposedMailProtocol

extension VerificationViewController: SelectProposedMailProtocol {
    func selectProposedMail(indexPath: IndexPath) {
        guard let text = mailTextField.text else { return }
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filteredMailArray[indexPath.row]
        let mailFullName = verificationModel.nameMail + domainMail
        mailTextField.text = mailFullName
        statusLabel.isValid = mailFullName.isValid()
        verificationButton.isValid = mailFullName.isValid()
        verificationModel.filteredMailArray = []
        collectionView.reloadData()
    }
    
}

//MARK: - ActionsgMailTextFieldProtocol

extension VerificationViewController: ActionsgMailTextFieldProtocol {
    func typingText(text: String) {
        statusLabel.isValid = text.isValid()
        verificationButton.isValid = text.isValid()
        verificationModel.getFilteredMail(text: text)
        collectionView.reloadData()
    }
    
    func cleanOutTextField() {
        statusLabel.setDefaultSetting()
        verificationButton.setDefaultSetting()
        verificationModel.filteredMailArray = []
        collectionView.reloadData()
    }
    
    
}

//MARK: - setConstraints

extension VerificationViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])

    }
}
