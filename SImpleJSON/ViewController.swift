//
//  ViewController.swift
//  SImpleJSON
//
//  Created by Sergio Bost on 9/29/21.
//

import UIKit

class ViewController: UIViewController {

    let getJSONButton = UIButton(type: .system)
    let clearButton = UIButton(type: .system)
    var nameTextField: UITextField!
    var genderProbResults: GenderProb?
    
    var delegate: NamePasserDelegate?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemTeal
        
        
        
        nameTextField = UITextField()
        
        view.addSubview(getJSONButton)
        view.addSubview(nameTextField)
        view.addSubview(clearButton)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Enter name"
        nameTextField.delegate = self
        nameTextField.layer.cornerRadius = 10
        nameTextField.backgroundColor = .white
        nameTextField.setLeftPaddingPoints(10)
        
        
        getJSONButton.setTitle("GET JSON", for: .normal)
        getJSONButton.setTitleColor(.white, for: .normal)
        getJSONButton.translatesAutoresizingMaskIntoConstraints = false
        getJSONButton.backgroundColor = .black
        getJSONButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        getJSONButton.layer.cornerRadius = 10
        getJSONButton.addTarget(self, action: #selector(getJSON), for: .touchUpInside)
        
        clearButton.setTitle("CLEAR", for: .normal)
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.backgroundColor = .red
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        clearButton.layer.cornerRadius = 10
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            nameTextField.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            nameTextField.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            nameTextField.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: 0),
            
            getJSONButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            getJSONButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            getJSONButton.heightAnchor.constraint(equalToConstant: 40),
            getJSONButton.widthAnchor.constraint(equalTo: nameTextField.widthAnchor, multiplier: 0.45, constant: 0),
            
            clearButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            clearButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            clearButton.heightAnchor.constraint(equalToConstant: 40),
            clearButton.widthAnchor.constraint(equalTo: nameTextField.widthAnchor, multiplier: 0.45)
            
        ])
    }
    
    @objc func getJSON() {
        guard nameTextField.text != nil else { return }
        let apiManger = APIManager()

        apiManger.fetchResults(with: nameTextField.text!) { results in
            self.genderProbResults = results
            print(results)
        }
        
        self.delegate?.passName(nameTextField.text!) // Delegate not being called
        self.present(GenderView(), animated: true)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
    }
    
    @objc func clearText() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        print(" GOOD ")
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

protocol NamePasserDelegate {
    func passName(_ name: String)
}
