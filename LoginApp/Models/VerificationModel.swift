//
//  VerificationModel.swift
//  LoginApp
//
//  Created by Nurqalam on 18.04.2022.
//

import Foundation

class VerificationModel {
    
    private let mailsArray = ["@gmail.com", "@yandex.ru", "@yahoo.com"]
    
    public var nameMail = String()
    public var filteredMailArray = [String]()
    
    private func filtringMails(text: String) {
        
        var domainMail = String()
        filteredMailArray = []
        
        guard let firstIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainMail = String(range)
        
        mailsArray.forEach { mail in
            if mail.contains(domainMail) {
                if !filteredMailArray.contains(mail) {
                    filteredMailArray.append(mail)
                }
            }
        }
    }
    
    private func deriveNameMail(text: String) {
        guard let atSimbolIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: atSimbolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        nameMail = String(range)
    }
    
    public func getFilteredMail(text: String) {
        filtringMails(text: text)
    }
    
    public func getMailName(text: String) {
        deriveNameMail(text: text)
    }
}
