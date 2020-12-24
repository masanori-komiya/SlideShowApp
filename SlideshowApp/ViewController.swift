//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小宮聖智 on 2020/12/22.
//  Copyright © 2020 masanori.komiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var startstopButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer!
    
    var nowIndex:Int = 0
    
    let imageArray:[UIImage] = [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if nowIndex == 3 {
            nowIndex = 0
        } else {
            nowIndex += 1
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func backImage(_ sender: Any) {
        if nowIndex == 0 {
            nowIndex = 3
        } else {
            nowIndex -= 1
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        if(self.timer == nil) {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startstopButton.setTitle("停止", for: .normal)
            
            nextButton.isEnabled = false
            backButton.isEnabled = false
        } else {
            self.timer.invalidate()
            
            self.timer = nil
            
            startstopButton.setTitle("再生", for: .normal)
            
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    @objc func changeImage() {
        if nowIndex == 3 {
            nowIndex = 0
        } else {
            nowIndex += 1
        }
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let transViewController:TransViewController = segue.destination as! TransViewController
        transViewController.x = nowIndex
        if(self.timer != nil ){
            self.timer.invalidate()
            self.timer = nil
            startstopButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

