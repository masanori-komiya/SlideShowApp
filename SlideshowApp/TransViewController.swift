//
//  TransViewController.swift
//  SlideshowApp
//
//  Created by 小宮聖智 on 2020/12/23.
//  Copyright © 2020 masanori.komiya. All rights reserved.
//

import UIKit

class TransViewController: UIViewController {
    
    @IBOutlet weak var popView: UIImageView!
    
    let imageArray:[UIImage] = [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!]
    
    var x:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        popView.image = imageArray[x]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
