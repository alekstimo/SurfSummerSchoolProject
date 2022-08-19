//
//  FavoriteTableViewCell.swift
//  IOS_Summer_school
//
//
//

import UIKit

class FavoriteTableViewCell: UICollectionViewCell {

    //MARK: - UICollectionViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance() 
    }
    
    //MARK: - Views
    @IBOutlet private weak var cortImageView: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var cortTitle: UILabel!
    @IBOutlet private weak var cortDate: UILabel!
    @IBOutlet private weak var cortText: UILabel!
    //MARK: - Calculated
   
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
            cortTitle.text = title
        }
    }
    
    var imageUrlInString: String = "" {
           didSet {
               guard let url = URL(string: imageUrlInString) else {
                   return
               }
               cortImageView.loadImage(from: url)
           }
       }
    
    var isFavorite: Bool = true {
        didSet {
            favoriteButton.setImage(UIImage(named: "FavoriteSelected"), for: .normal)
        }
    }
    var text: String = "" {
        didSet {
            cortText.text = text
        }
    }
    var date: String = "" {
        didSet {
            cortDate.text = date
        }
    }
    
}

//MARK: - Private Methods
private extension FavoriteTableViewCell{
    func configureApperance() {
        cortTitle.textColor = .black
        cortTitle.font = .systemFont(ofSize: 16)
        
        cortImageView?.layer.cornerRadius = 12
        cortImageView?.contentMode = .scaleAspectFill
        
        cortDate.font = .systemFont(ofSize: 10)
        cortDate.textColor = .gray
        
        cortText.textColor = .black
        cortText.font = .systemFont(ofSize: 12)
        
        favoriteButton.tintColor = .white
        isFavorite = true
    }
}
