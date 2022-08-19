//
//  NetworkMethod.swift
//  IOS_Summer_school
//
//  
//

import Foundation

enum NetworkMethod: String {
    
    case get
    case post
}
extension NetworkMethod {
    
    var method: String {
        rawValue.uppercased()
    }
}
