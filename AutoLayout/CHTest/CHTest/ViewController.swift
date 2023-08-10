//
//  ViewController.swift
//  CHTest
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
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        let view1 = makeView(text: "1234567", color: .red)
        let view2 = makeView(text: "1234567124214214", color: .blue)
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        
        
    }

    func makeView(text: String, color: UIColor) -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        view.text = text
        view.numberOfLines = 0
        return view
    }

}

