//
//  ProfileModule.swift
//  IOS_Summer_school
//
//  
//

import Foundation

class ProfileModel {
    // MARK: - Internal Properties
    var imageUrlInString: String
    var firstName: String
    var lastName: String
    var city: String
    var telephone: String
    var email: String
    var information: String
    
    var didItemsUpdated: (() -> Void)?

        // MARK: - Initialization
    internal init(imageUrlInString: String, firstName: String, city: String, telephone: String, email: String, info: String,lastName: String) {
            self.imageUrlInString = imageUrlInString
            self.firstName = firstName
            self.city = city
            self.telephone = telephone
            self.email = email
            self.information = info
            self.lastName = lastName
            

        }
    func loadProfile()  {

        let tempCredentials = AuthRequestModel(phone:UserSettings.userName, password:UserSettings.password)
        AuthService().perfomLoginRequest(credentials: tempCredentials) { [weak self] result in
                switch result {
                case .success(let information):
                    self?.imageUrlInString = information.user_info.avatar
                    self?.firstName = information.user_info.firstName
                    self?.lastName = information.user_info.lastName
                    self?.city = information.user_info.city
                    self?.telephone = self?.format(phoneNumber: information.user_info.phone) ?? " "
                    self?.email = information.user_info.email
                    self?.information = information.user_info.about
                    self?.didItemsUpdated?()
                case .failure(let error):
                    print(error.localizedDescription)
                    break

                    // TODO: - Implement error state there

                }
            }

        }
    static func createDefault() -> ProfileModel {
        .init(
            imageUrlInString: " ",
            firstName: " ",
            city: " ",
            telephone: " ",
            email:" ",
            info:" ",
            lastName: " ")
    }
    private func format(phoneNumber: String) -> String {
        let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options:[], range: range, withTemplate: "")
        
        
        
        
        let maxIndex = number.index(number.startIndex,offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
        number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3 $4 $5",options: .regularExpression,range: regRange)
        
        return "+" + number
    }
    
}
