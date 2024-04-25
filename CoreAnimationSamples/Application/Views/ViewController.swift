//
//  ViewController.swift
//  CoreAnimationSamples
//
//  Created by Gabriel Rosa on 4/24/24.
//

import UIKit

class ViewController: UIViewController {

    let blueView = UIView()
    let blueViewContent = UIView()
    let actionsCollectionView = ActionsCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(blueViewContent)
        self.view.addSubview(actionsCollectionView)

        blueView.backgroundColor = .blue
        blueViewContent.addSubview(blueView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        blueView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueView.heightAnchor.constraint(equalToConstant: 50),
            blueView.widthAnchor.constraint(equalToConstant: 50),
            blueView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            blueView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])

        actionsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        actionsCollectionView.viewToMove = blueView
        NSLayoutConstraint.activate([
            actionsCollectionView.heightAnchor.constraint(equalToConstant: 100),
            actionsCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            actionsCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            actionsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40)
        ])

        blueViewContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueViewContent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blueViewContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blueViewContent.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            blueViewContent.bottomAnchor.constraint(equalTo: actionsCollectionView.topAnchor)
        ])
    }
}
