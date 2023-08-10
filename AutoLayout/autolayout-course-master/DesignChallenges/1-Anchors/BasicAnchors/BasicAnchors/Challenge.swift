//
//  Challenge.swift
//  BasicAnchors
//
//  Created by Jonathan Rasmusson (Contractor) on 2019-08-26.
//  Copyright © 2019 Jonathan Rasmusson. All rights reserved.
//

import UIKit

class Challenge: UIViewController {

    let margin: CGFloat = 20
    let spacing: CGFloat = 32

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    func setupNavigationBar() {
        navigationItem.title = "Playback"
    }

    func setupViews() {

        let offlineLabel = makeLabel(withText: "Offline")
        let offlineSwitch = makeSwitch(isOn: false)
                let offlineSublabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        //
                let crossfadeLabel = makeBoldLabel(withText: "Crossfade")
                let crossfadeMinLabel = makeSubLabel(withText: "0s")
                let crossfadeMaxLabel = makeSubLabel(withText: "12s")
                let crossfadeProgressView = makeProgressView()
        //
        //        let gaplessPlaybackLabel = makeLabel(withText: "Gapless Playback")
        //        let gaplessPlaybackSwitch = makeSwitch(isOne: true)
        //
        //        let hideSongsLabel = makeLabel(withText: "Hide Unplayable Songs")
        //        let hideSongsSwitch = makeSwitch(isOne: true)
        //
        //        let enableNormalizationLabel = makeLabel(withText: "Enable Audio Normalization")
        //        let enableNormalizationSwitch = makeSwitch(isOne: true)


        view.addSubview(offlineLabel)
        view.addSubview(offlineSwitch)
        view.addSubview(offlineSublabel)
        view.addSubview(crossfadeLabel)
        view.addSubview(crossfadeMinLabel)
        view.addSubview(crossfadeProgressView)
        view.addSubview(crossfadeMaxLabel)
        
        
        NSLayoutConstraint.activate([
            offlineLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            offlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: margin),
            
            offlineSwitch.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            offlineSwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: margin),
            
            offlineSublabel.topAnchor.constraint(equalTo: offlineSwitch.bottomAnchor, constant: margin),
            offlineSublabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            offlineSublabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            
            crossfadeLabel.topAnchor.constraint(equalTo: offlineSublabel.bottomAnchor, constant: spacing),
            crossfadeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            crossfadeMinLabel.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: spacing),
            crossfadeMinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            
            crossfadeProgressView.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor),
            crossfadeProgressView.leadingAnchor.constraint(equalTo: crossfadeMinLabel.trailingAnchor, constant: 4),
            crossfadeProgressView.trailingAnchor.constraint(equalTo: crossfadeMaxLabel.leadingAnchor, constant: -4),
            
            crossfadeMaxLabel.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor),
            crossfadeMaxLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            
        ])
        

    }
}

