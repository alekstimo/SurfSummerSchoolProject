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
    
    override var isHighlighted: Bool {
        didSet{
            UIView.animate(withDuration: 0.2){
                self.contentView.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
            }
        }
    }
    
    //MARK: - properties
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var imageUrlInString: String = "" {
           didSet {
               guard let url = URL(string: imageUrlInString) else {
                   return
               }
               imageView.loadImage(from: url)
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
