//
//  JSONTableTableViewController.swift
//  SImpleJSON
//
//  Created by Sergio Bost on 9/29/21.
//

import UIKit

class GenderView: UIViewController, NamePasserDelegate {
    
    var label: UILabel!
    
    override func viewDidLoad() {
        label = UILabel()
        view.addSubview(label)
        view.backgroundColor = .blue
        
        let homeView = ViewController()
        homeView.delegate = self
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TEST"
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ])
    }
    
    func passName(_ name: String) {
       
        label.text = name
    }
}
