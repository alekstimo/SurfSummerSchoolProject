//
//  AuthService.swift
//  IOS_Summer_school
//
//
//

import Foundation

struct AuthService {
    
    let dataTask = BaseNetworkTask<AuthRequestModel, AuthResponseModel>(
        isNeedInjectToken: false,
        method: .post,
        path: "auth/login")
    
    func perfomLoginRequest(credentials: AuthRequestModel, _ onResponseReceived: @escaping (_ result: Result<AuthResponseModel, Error>) -> Void) {
        
        dataTask.perfomRequest(credentials) { result in
            if case let .success(responseModel) = result {
                try? dataTask.tokenStorage.set(newToken: TokenContainer(token: responseModel.token, receivingDate: .now))
            }
            onResponseReceived(result)
            
        }
    }
    
    
}
