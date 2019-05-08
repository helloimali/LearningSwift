//
//  ViewController.swift
//  WarCardGame
//
//  Created by Ali Malik on 5/8/19.
//  Copyright © 2019 Malik Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LeftImgView: UIImageView!
    
    @IBOutlet weak var RIghtImgView: UIImageView!
    
    
    @IBOutlet weak var PlayerScore: UILabel!
    
    @IBOutlet weak var CPUScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dealTap(_ sender: Any) {
        let leftNum = Int.random(in: 2...14)
        let rightNum = Int.random(in: 2...14)
        
        LeftImgView.image = UIImage(named: "card" + String(leftNum))
        RIghtImgView.image = UIImage(named: "card" + String(rightNum))
    }
    
}

