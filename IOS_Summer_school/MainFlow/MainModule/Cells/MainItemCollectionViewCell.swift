//
//  MainItemCollectionViewCell.swift
//  IOS_Summer_school
//
//
//

import UIKit

class MainItemCollectionViewCell: UICollectionViewCell {

    //MARK: - UICollectionViewCell
    /*override func prepareForReuse() {
        super.prepareForReuse()
    }*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }
    //MARK: - Constants
    private enum Constants {
        static let favoriteSelected = UIImage(named: "FavoriteSelected")
        static let favoriteNotSelected = UIImage(named: "FavoriteNotSelected")
    }
    
    //MARK: - Views
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    
    //MARK: - Events
    
    var didFavoriteTapped: (()->Void)?
    
    //MARK: - Calculated
    var buttonImage:UIImage?{
        return isFavorite ? Constants.favoriteSelected : Constants.favoriteNotSelected
    }
    
    //MARK: - properties
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var isFavorite: Bool = false {
        didSet {
            favoriteButton.setImage(buttonImage, for: .normal)
        }
        
    }
    
    
    //MARK: - Actions
    @IBAction private func favoriteAction(_ sender: UIButton) {
        didFavoriteTapped?()
        isFavorite.toggle()
    }
}

//MARK: - Private Methods

private extension MainItemCollectionViewCell{
    func configureApperance() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)
        
        imageView.layer.cornerRadius = 12
        
        favoriteButton.tintColor = .white
        isFavorite = false
    }
}
