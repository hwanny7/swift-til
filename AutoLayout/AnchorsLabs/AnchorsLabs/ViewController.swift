//
//  ViewController.swift
//  AnchorsLabs
//
//  Created by yun on 2023/08/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpViews()
    }
    
    
    func setUpViews() {
        let small = makeLabel(withText: "upperLeft", size: 12)
        let big = makeLabel(withText: "upperLeft", size: 32)
        
        let upperLeftLabel = makeLabel(withText: "upperLeft")
        view.addSubview(upperLeftLabel)
        upperLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperLeftLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        
        let upperRightLabel = makeLabel(withText: "upperRight")
        view.addSubview(upperRightLabel)
        upperRightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperRightLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        let lowerLeftLabel = makeSecondaryLabel(withText: "lowerLeftLabel")
        view.addSubview(lowerLeftLabel)
        lowerLeftLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        lowerLeftLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        
        let lowerRightButton = makeButton(withText: "lowerLeftLabel")
        view.addSubview(lowerRightButton)
        lowerRightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        lowerRightButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        let blueView = makeView()
        view.addSubview(blueView)
        
        //center
        blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // width
        blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        
        // height
        blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        
// Option 1: Size explicitly
//        blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        blueView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    func makeLabel(withText text: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: size)
        label.backgroundColor = .yellow
        
        return label
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        
        return label
    }
    
    func makeSecondaryLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        
        return label
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .blue
        
        return button
    }
    
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }

}

