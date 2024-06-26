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
    var leadingConstraint: NSLayoutConstraint?
    var centerXConstraint: NSLayoutConstraint?
    var collectionViewLeading: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(blueViewContent)
        self.view.addSubview(actionsCollectionView)

        blueView.backgroundColor = .blue
        blueViewContent.addSubview(blueView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let offScreenLeading: CGFloat = -1000.0

        leadingConstraint = blueView
            .leadingAnchor.constraint(
                equalTo: self.view.leadingAnchor, 
                constant: offScreenLeading
            )
        centerXConstraint = blueView
            .centerXAnchor.constraint(
                equalTo: self.view.centerXAnchor
            )

        blueView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueView.heightAnchor.constraint(equalToConstant: 50),
            blueView.widthAnchor.constraint(equalToConstant: 50),

            blueView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        leadingConstraint?.isActive = true
        centerXConstraint?.isActive = false

        actionsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewLeading = actionsCollectionView
            .leadingAnchor.constraint(
                equalTo: self.view.leadingAnchor, 
                constant: offScreenLeading
            )
        actionsCollectionView.viewToMove = blueView
        NSLayoutConstraint.activate([
            actionsCollectionView.heightAnchor.constraint(equalToConstant: 100),
            actionsCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            actionsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40)
        ])
        collectionViewLeading?.isActive = true

        blueViewContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueViewContent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blueViewContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blueViewContent.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            blueViewContent.bottomAnchor.constraint(equalTo: actionsCollectionView.topAnchor)
        ])

        addEntryAnimation()
    }

    func addEntryAnimation() {
        let duration = 1.0
        let onScreenCollectionViewLeading = 16.0

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            let blueViewAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
                self?.leadingConstraint?.isActive = false
                self?.centerXConstraint?.isActive = true
                self?.view.layoutIfNeeded()
            }

            blueViewAnimator.startAnimation()

            let collectionViewAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
                self?.collectionViewLeading?.constant = onScreenCollectionViewLeading
                self?.view.layoutIfNeeded()
            }

            collectionViewAnimator.startAnimation(afterDelay: 0.2)
        }
    }
}
