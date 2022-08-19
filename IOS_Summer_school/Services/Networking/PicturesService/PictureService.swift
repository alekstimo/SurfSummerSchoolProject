//
//  PictureService.swift
//  IOS_Summer_school
//
//
//

import Foundation

struct PictureService {

    let dataTask = BaseNetworkTask<EmptyModel, [PictureResponseModel]>(
        isNeedInjectToken: true,
        method: .get,
        path: "picture/"
    )

    func loadPictures(_ onResponseWasReceived: @escaping (_ result: Result<[PictureResponseModel], Error>) -> Void) {
        dataTask.perfomRequest(onResponseWasReceived)
    }

}
