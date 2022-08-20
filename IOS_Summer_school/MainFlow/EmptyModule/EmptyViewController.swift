//
//  EmptyViewController.swift
//  IOS_Summer_school
//
//
//

import UIKit

class EmptyViewController: UIViewController {

    
    
    @IBOutlet weak var emptyViewReloadButton: UIButton!
  
    @IBOutlet weak var emptyViewText: UILabel!
    
    @IBAction func reloadButtonPushed(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        emptyViewText.text = "Не удалось загрузить ленту \nОбновите экран или попробуйте позже"
        emptyViewReloadButton.setTitle("Обновить", for: .normal)

    }


}
