//
//  MainModel.swift
//  IOS_Summer_school
//
//
//
import Foundation
import UIKit
import SwiftUI

final class MainModel {
    
    //MARK: - Events
    
    var didItemsUpdated: (() -> Void)?
    
    //MARK: - Properties
    
    let pictureService = PictureService()
    var items: [DetailItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    //MARK: - Methods
    
    func loadPosts()  {
        
            pictureService.loadPictures { [weak self] result in
                switch result {
                case .success(let pictures):
                    self?.items = pictures.map { pictureModel in
                        DetailItemModel(
                            imageUrlInString: pictureModel.photoUrl,
                            title: pictureModel.title,
                            isFavorite: false, // TODO: - Need adding `FavoriteService`
                            content: pictureModel.content,
                            dateCreation: pictureModel.date
                        )
                    }
                case .failure(let error):
                    
                    break
                    
                    // TODO: - Implement error state there
                   
                }
            }
        
        }
    
    func reloadData()  {
        loadPosts()
    }
    
}
