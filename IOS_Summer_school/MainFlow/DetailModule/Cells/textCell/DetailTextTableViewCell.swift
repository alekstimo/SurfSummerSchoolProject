//
//  DetailTextTableViewCell.swift
//  IOS_Summer_school
//
//  Created by Кирилл Зезюков on 11.08.2022.
//

import UIKit

class DetailTextTableViewCell: UITableViewCell {

    
    //MARK: - View
    @IBOutlet private weak var contentLabel: UILabel!
    //MARK: - Properties
    var text: String? {
        didSet{
            contentLabel.text = text
        }
    }
    
     //MARK: - UITableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }
    
    private func configureApperance() {
        selectionStyle = .none
        contentLabel.font = .systemFont(ofSize: 12, weight: .light)
        
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 0
    }
}
