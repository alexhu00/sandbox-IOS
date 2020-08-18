//
//  VideoPlayerViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-07.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import AVKit
import Analytics

class VideoPlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playVideo(_ sender: Any) {
        Analytics.shared().track("15: Video Button Tapped")
        if let path = Bundle.main.path(forResource: "testVideo", ofType: "MP4"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion:
            {
                video.play()
                Analytics.shared().track("15: Video Played")
            } )
        }
        
    }
    
}
