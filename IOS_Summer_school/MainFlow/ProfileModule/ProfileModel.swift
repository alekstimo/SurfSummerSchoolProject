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
            //Форматирование телефона?

        }
    func loadProfile()  {

        let tempCredentials = AuthRequestModel(phone:"+71234567890", password:"qwerty")
        AuthService().perfomLoginRequest(credentials: tempCredentials) { [weak self] result in
                switch result {
                case .success(let information):
                    self?.imageUrlInString = information.user_info.avatar
                    self?.firstName = information.user_info.firstName
                    self?.lastName = information.user_info.lastName
                    self?.city = information.user_info.city
                    self?.telephone = information.user_info.phone
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
            imageUrlInString: "https://bit.ly/3mnUUhB",
            firstName: "Василий",
            city: "Воронеж",
            telephone: "765432143 ",
            email:"ффф@mail.ru ",
            info:"Я человек",
            lastName: "Пупкин")
    }
    
    
}
