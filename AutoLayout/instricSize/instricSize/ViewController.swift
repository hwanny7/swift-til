//
//  ViewController.swift
//  instricSize
//
//  Created by yun on 2023/08/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        let label1 = makeLabel(withText: "Name")
        view.addSubview(label1)
        
        let textField = makeTextField(with: "submit name")
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            textField.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            textField.firstBaselineAnchor.constraint(equalTo: label1.firstBaselineAnchor),
            
        ])
        label1.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        

    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        
        return label
    }
    
    func makeTextField(with text: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = text
        textField.backgroundColor = .lightGray
        
        return textField
        
    }
    
}


