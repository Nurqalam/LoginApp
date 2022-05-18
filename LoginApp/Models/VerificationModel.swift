//
//  VerificationModel.swift
//  LoginApp
//
//  Created by Nurqalam on 18.04.2022.
//

import Foundation

class VerificationModel {
    
    private let mailsArray = ["@gmail.com", "@yandex.ru", "@nur.kz", "@yahoo.com"]
    
    public var nameMail = String()
    public var filteredMailsArray = [String]()
    
    private func filteringMails(text: String) {
        
        var domainName = String()
        filteredMailsArray = []
        
        guard let firstIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainName = String(range)
        
        mailsArray.forEach { mail in
            if mail.contains(domainName) {
                if !filteredMailsArray.contains(mail) {
                    filteredMailsArray.append(mail)
                }
            }
        }
    }
    
    private func deriveMailsName(text: String) {
        guard let atSimbolIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: atSimbolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        nameMail = String(range)
    }
    
    public func getNameMail(text: String) {
        deriveMailsName(text: text)
    }
    
    public func getFilteredMails(text: String) {
        filteringMails(text: text)
    }
    
    public func setDefaultSettings() {
        filteredMailsArray = []
    }
}
