//
//  ViewController.swift
//  Sample
//
//  Created by Selek, Abdullah on 23.10.17.
//  Copyright © 2017 Abdullah Selek. All rights reserved.
//

import UIKit
import AVKit
import Swifty360Player

class ViewController: UIViewController {

    var swifty360ViewController: Swifty360ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black

        let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "google-help-vr", ofType: "mp4")!)
        let player = AVPlayer(url: videoURL)

        let motionManager = Swifty360MotionManager.shared
        swifty360ViewController = Swifty360ViewController(withAVPlayer: player, motionManager: motionManager)

        addChildViewController(swifty360ViewController)
        view.addSubview(swifty360ViewController.view)
        swifty360ViewController.didMove(toParentViewController: self)

        player.play()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(reorientVerticalCameraAngle))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func reorientVerticalCameraAngle() {
        swifty360ViewController.reorientVerticalCameraAngleToHorizon(animated: true)
    }

}

