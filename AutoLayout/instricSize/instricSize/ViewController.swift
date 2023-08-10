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
        let label1 = makeLabel(withText: "label1")
        view.addSubview(label1)
        
        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true

    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = BigLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .yellow
        
        return label
    }
}

class BigLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 300)
    }
}

