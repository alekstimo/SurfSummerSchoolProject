//
//  SpinnerViewController.swift
//  IOS_Summer_school
//
//
//

import UIKit

class SpinnerViewController: UIViewController {

    var spinner = UIActivityIndicatorView(style: .large)
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .white
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
//        NSLayoutConstraint.activate([
//            spinner.leftAnchor.constraint(equalTo: view.leftAnchor),
//            spinner.rightAnchor.constraint(equalTo: view.rightAnchor),
//            spinner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            spinner.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    

}
