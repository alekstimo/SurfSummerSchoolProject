//
//  DetailViewController.swift
//  IOS_Summer_school
//
//
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet weak var leftLabelContsraint: NSLayoutConstraint!
    
    func animatelabel() {
        UIView.animate(withDuration: 0.3) {
            self.leftLabelContsraint.constant = 50
        }
    }
}
