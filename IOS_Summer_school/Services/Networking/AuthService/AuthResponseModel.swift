//
//  AuthResponseModel.swift
//  IOS_Summer_school
//
//
//

import Foundation

struct AuthResponseModel: Decodable{
    
    let token: String
    let user_info: user_info
}

struct user_info: Decodable {
    
    var id: String
    var phone: String
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    var city: String
    var about: String

}
