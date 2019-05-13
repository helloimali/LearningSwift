//
//  ViewController.swift
//  cocoa
//
//  Created by Ali Malik on 5/11/19.
//  Copyright © 2019 Malik Studios. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let postsURLEndPoint: String = "https://jsonplaceholder.typicode.com/posts/1"
        
        //Alamofire.request(postsURLEndPoint, method: .get).responseJSON{response in print(response.result.value)}
        
        Alamofire.request(postsURLEndPoint)
            .responseJSON{ response in
                guard let json = response.result.value as? [String:Any] else{
                    return
                }
            print(json)
            print(json["title"])
            print("THIS IS THE BODY: ")
            print(json["body"])
        }
        
        

    
    
    }
}

