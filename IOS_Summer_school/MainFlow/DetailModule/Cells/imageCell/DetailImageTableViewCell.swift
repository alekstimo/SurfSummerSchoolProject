//
//  DetailImageTableViewCell.swift
//  IOS_Summer_school
//
//
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {

    //MARK: - View
    @IBOutlet private weak var cornImageView: UIImageView!
    
    //MARK: - Properties
    var image: UIImage? {
        didSet {
            cornImageView.image = image
        }
    }
    
    //MARK: - UITableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        cornImageView?.layer.cornerRadius = 12
        cornImageView?.contentMode = .scaleAspectFill
    }
    
}
