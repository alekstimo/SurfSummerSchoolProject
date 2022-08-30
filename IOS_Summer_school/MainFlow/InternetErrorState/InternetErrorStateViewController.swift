//
//  InternetErrorStateViewController.swift
//  IOS_Summer_school
//
//

import UIKit

class InternetErrorStateViewController: UIViewController {

    
    @IBOutlet weak var errorViewHeight: NSLayoutConstraint!
    @IBAction func ClosePan(_ sender: Any) {
        self.closeError()    }
    
    @IBOutlet weak var ErrorViewTop: NSLayoutConstraint!
    @IBOutlet weak var ErrorText: UILabel!
    
    enum errorState{
        case internet
        case wrongData
    }
    var errorData: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ErrorText.textColor = .white
        ErrorText.text = errorData
        showError()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        errorViewHeight.constant = self.view.bounds.height * 0.1144
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
    func configure(state: errorState)  {
        switch state{
        case .internet:
            errorData = "Отсутствует интернет-соединение \nПопробуйте позже"
        case .wrongData:
            errorData = "Логин или пароль введен неправильно"
        }
    }
    
    func closeError() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.transitionCurlUp], animations:  {
            
            self.ErrorViewTop.constant = -self.errorViewHeight.constant
            self.view.layoutIfNeeded()
            
        }) { _ in
        self.view.removeFromSuperview()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    func showError() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        UIView.animate(withDuration: 0.5, delay: 0, options: [.transitionCurlUp]) {
            self.ErrorViewTop.constant = 0
            self.view.layoutIfNeeded()
        }

    }


}
