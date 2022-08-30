//
//  NetworkTask.swift
//  IOS_Summer_school
//
//
//

import Foundation

protocol NetworkTask {
    
    associatedtype Input: Encodable
    associatedtype Output: Decodable
    
    var baseURL: URL? { get }
    var path: String { get }
    var completedURL: URL? { get }
    var method: NetworkMethod { get }
    
    func perfomRequest(_ input: Input, _ onResponseReceived: @escaping (_ result: Result <Output, Error>) -> Void)
}

extension NetworkTask {
    
    var comlitedURL: URL? {
        baseURL?.appendingPathComponent(path)
    }
}

