//
//  ViewController.swift
//  SafeAreaLab
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
        let topLabel = makeLabel(withText: "Top")
        let bottomLabel = makeLabel(withText: "Bottom")
        let leadingLabel = makeLabel(withText: "leading")
        let trailingLabel = makeLabel(withText: "trailing")
        
        view.addSubview(topLabel)
        view.addSubview(bottomLabel)
        view.addSubview(leadingLabel)
        view.addSubview(trailingLabel)
        
        NSLayoutConstraint.activate(
            [        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
                     topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                     bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
                     bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                leadingLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                leadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                trailingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                trailingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
        )
        
        
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }


}

