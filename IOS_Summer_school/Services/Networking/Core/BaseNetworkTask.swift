//
//  BaseNetworkTask.swift
//  IOS_Summer_school
//
//
//

import Foundation

struct BaseNetworkTask<AbstractInput: Encodable, AbstractOutput: Decodable>: NetworkTask {
    var completedURL: URL?
    
    
    //MARK: - NetworkTask
    typealias Input = AbstractInput
    typealias Output = AbstractOutput
    
    var baseURL: URL? {
        URL(string: "https://pictures.chronicker.fun/api")
    }
    
    let path: String
    let method: NetworkMethod
    let session: URLSession = URLSession(configuration: .default)
    let isNeedInjectToken: Bool
    var urlCache: URLCache {
        URLCache.shared
    }
    
    var tokenStorage: TokenStorage {
        BaseTokenStorage()
    }
    
    //MARK: - Initilization
    
    init(isNeedInjectToken: Bool, method: NetworkMethod, path: String) {
        self.path = path
        self.method = method
        self.isNeedInjectToken = isNeedInjectToken
    }
    
    //MARK: - NetworkTask
    
    func perfomRequest(_ input: AbstractInput, _ onResponseReceived: @escaping (_ result: Result<AbstractOutput, Error>) -> Void) {
        
        do {
            
            let request = try getRequest(with: input)
            
            
            session.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    onResponseReceived(.failure(error))
                    isLoadedSucces = false
                } else if let data = data {
                    
                    do {
                        let mappedModel = try JSONDecoder().decode(AbstractOutput.self, from: data)
                        onResponseReceived(.success(mappedModel))
                        saveResponseToCache(response, cachedData: data, by: request)
                        isLoadedSucces = true
                    } catch {
                        
                        onResponseReceived(.failure(error))
                        isLoadedSucces = false
                    }
                    
                } else {
                    onResponseReceived(.failure(NetworkTaskErorr.unknownError))
                    isLoadedSucces = false
                }
                
            }
            
            .resume()
            if(isLoadedSucces) {
                return
            }
            if let cachedResponse =  try getCachedResponseFromCache(by: request) {
                let mappedModel = try JSONDecoder().decode(AbstractOutput.self, from: cachedResponse.data)
                onResponseReceived(.success(mappedModel))
                isLoadedSucces = false
                return
            }
       
        } catch {
            onResponseReceived(.failure(error))
            isLoadedSucces = false
        }
        
    }
        
}

//MARK: - Empty Model

extension BaseNetworkTask where Input == EmptyModel {
    
    func perfomRequest(_ onResponseReceived: @escaping (_ result: Result<AbstractOutput, Error>) -> Void) {
        perfomRequest(EmptyModel(), onResponseReceived)
    }
    
}

//MARK: - Cache

private extension BaseNetworkTask {
    
    func getCachedResponseFromCache( by request: URLRequest) throws -> CachedURLResponse? {
        
        return urlCache.cachedResponse(for: request)
    }
    
    func saveResponseToCache(_ response: URLResponse?, cachedData: Data?, by request: URLRequest) {
        
        guard let response = response, let cachedData = cachedData else {
            return
        }
        let cachedResponse = CachedURLResponse(response: response,data: cachedData)
        urlCache.storeCachedResponse(cachedResponse, for: request)

        
    }
    
}

//MARK: - PrivateNethods

private extension BaseNetworkTask {
    enum NetworkTaskErorr: Error {
        case unknownError
        case urlWasNotFound
        case urlComponentWasNotCreated
        case parametersIsNotValidJSONObject
    }
    func getRequest(with parameters: AbstractInput) throws -> URLRequest {
        guard let url = comlitedURL else {
            throw NetworkTaskErorr.urlWasNotFound
        }
       
        var request: URLRequest
        switch method {
        case .get:
            let  newUrl = try getUrlWithQueryParameters(for: url, parameters: parameters)
            request = URLRequest(url: newUrl)
        case .post:
            request = URLRequest(url: url)
            request.httpBody = try getParametersforBody(from: parameters)
        }
        request.httpMethod = method.method
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if isNeedInjectToken {
            request.addValue("Token \(try tokenStorage.getToken().token)", forHTTPHeaderField: "Authorization")
        }
        
        
        return request
    }
    
    func getParametersforBody(from encodebleParameters: AbstractInput) throws -> Data {
        return try JSONEncoder().encode(encodebleParameters)
    }
    
    func getUrlWithQueryParameters(for url: URL, parameters: AbstractInput) throws -> URL {
        guard var urlCompinents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw NetworkTaskErorr.urlComponentWasNotCreated
        }
        let parametersInDataRepresentation = try JSONEncoder().encode(parameters)
        let parametersInDictionaryRepresentation = try  JSONSerialization.jsonObject(with: parametersInDataRepresentation)
        
        guard let parametersInDictionaryRepresentation = parametersInDictionaryRepresentation as? [String: Any] else {
            throw NetworkTaskErorr.parametersIsNotValidJSONObject
        }
        
        let queryItems = parametersInDictionaryRepresentation.map { key, value in
            return URLQueryItem(name: key, value: "\(value)")
            
        }
        if !queryItems.isEmpty {
            
            urlCompinents.queryItems = queryItems
            
        }
        
        guard let newUrlWithquery = urlCompinents.url else {
            throw NetworkTaskErorr.urlWasNotFound
        }
        
        return newUrlWithquery
    }
    
    
    
}

