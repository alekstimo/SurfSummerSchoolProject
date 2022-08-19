//
//  EmptyViewController.swift
//  IOS_Summer_school
//
//  Created by Кирилл Зезюков on 17.08.2022.
//

import UIKit

class EmptyViewController: UIViewController {

    
    
    @IBOutlet weak var emptyViewReloadButton: UIButton!
  
    @IBOutlet weak var emptyViewText: UILabel!
    
    @IBAction func reloadButtonPushed(_ sender: Any) {
        self.view.removeFromSuperview()
       // self.model.reloadData()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        emptyViewText.text = "Не удалось загрузить ленту \nОбновите экран или попробуйте позже"
        emptyViewReloadButton.setTitle("Обновить", for: .normal)

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
