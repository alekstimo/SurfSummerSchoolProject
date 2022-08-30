//
//  SignUpViewController.swift
//  IOS_Summer_school
//
//
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBAction func SingUpButtonTapped(_ sender: Any) {
        
        if let login = loginTextField.text{
            if let passord = PasswordTextField.text{
                if(login.isEmpty) {
                    loginTextField.isError(baseColor: UIColor.gray.cgColor)
                    if (passord.isEmpty){
                        PasswordTextField.isError(baseColor: UIColor.gray.cgColor)
                        return
                    }
                }
                if (passord.isEmpty){
                    PasswordTextField.isError(baseColor: UIColor.gray.cgColor)
                    return
                }
                let range = NSString(string: login).range(of: login)
                var number = regex.stringByReplacingMatches(in: login, options:[], range: range, withTemplate: "")
                number = "+" + number
                let tmpCredentials = AuthRequestModel(phone: number, password: passord)
                AuthService().perfomLoginRequest(credentials: tmpCredentials) { [weak self] result in
                    switch result {
                    case .success:
                        DispatchQueue.main.async {
                            
                            UserSettings.userName = number
                            UserSettings.password = passord
                            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
                            
                            let vc = TabBarConfigurator().configure()
                            appDelegate.window?.rootViewController = vc
//                            self?.navigationController?.pushViewController(vc, animated: true)
                        }
                    case .failure:
                        self?.errorStateView()
                        break
                    }
                }
            } else {
                PasswordTextField.isError(baseColor: UIColor.gray.cgColor)
            }
        }
        else {
            loginTextField.isError(baseColor: UIColor.gray.cgColor)
        }
        
    }
    //MARK: - Properties
    let buttonImageShowPas = UIImage(named: "ShowPassword")
    let buttonImageDntShowPas = UIImage(named: "dntShowPassword")
    let button = UIButton(type: .custom)
    private let maxCountNumber = 11
    private let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
    
    @objc func showPasswordButtonTapped(_ sender: Any) {
        
        PasswordTextField.isSecureTextEntry = !PasswordTextField.isSecureTextEntry
        if PasswordTextField.isSecureTextEntry {
            button.setImage(buttonImageDntShowPas, for: .normal)
        }
        else {
            button.setImage(buttonImageShowPas, for: .normal)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    private func configure() {
       // loginTextField.shouldChangeText(in: , replacementText: String)
       
        
        loginTextField.clipsToBounds = true
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        PasswordTextField.clipsToBounds = true
        PasswordTextField.layer.cornerRadius = 10
        PasswordTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        PasswordTextField.setBottomBorderOnlyWith(color: UIColor.lightGray.cgColor)
        loginTextField.setBottomBorderOnlyWith(color: UIColor.lightGray.cgColor)
        
        loginTextField.indent(size: 18)
        PasswordTextField.indent(size: 18)
    
        button.setImage(buttonImageDntShowPas, for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        // Assign the overlay button to the text field
        PasswordTextField.rightView = button
        PasswordTextField.rightViewMode = .whileEditing
        PasswordTextField.isSecureTextEntry = true
        
    }
    
    private func format(phoneNumber: String, shoulRemoveLastDigit: Bool) -> String {
        guard !(shoulRemoveLastDigit && phoneNumber.count <= 2) else { return "+"  }
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options:[], range: range, withTemplate: "")
        
        if number.count > maxCountNumber {
            let maxIndex = number.index(number.startIndex,offsetBy: maxCountNumber)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shoulRemoveLastDigit {
            let maxIndex = number.index(number.startIndex,offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        let maxIndex = number.index(number.startIndex,offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3",options: .regularExpression,range: regRange)
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3 $4 $5",options: .regularExpression,range: regRange)
        }
        return "+" + number
    }
    
    private func errorStateView(){
        DispatchQueue.main.async {
            let errorState = InternetErrorStateViewController()
            errorState.configure(state: .wrongData)
            self.addChild(errorState)
            errorState.view.frame = self.view.frame
            self.view.addSubview(errorState.view)
            errorState.didMove(toParent: self)
        }
    }
   
}


extension UITextField {
    func setBottomBorderOnlyWith(color: CGColor) {
        self.borderStyle = .none
        self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func isError(baseColor: CGColor) {
//        let errorText = UILabel()
//        errorText.text = "Поле не может быть пустым"
//        errorText.textColor = .red
//        errorText.font = .systemFont(ofSize: 12)
//        errorText.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 15)
//        errorText.topAnchor.constraint(equalTo:
//        self.bottomAnchor, constant: -15).isActive = true
//        errorText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        //TODO: - Доделать ошибку
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration =  1.0
        
        self.layer.add(animation, forKey: "")
    }
    
    func indent(size:CGFloat) {
           self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
           self.leftViewMode = .always
       }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let fullStr = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullStr, shoulRemoveLastDigit: range.length == 1)
        
        return false
    }
    
}
