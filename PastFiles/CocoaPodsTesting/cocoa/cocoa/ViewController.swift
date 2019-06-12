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
        
//        Alamofire.request(postsURLEndPoint)
//            .responseJSON{ response in
//                guard let json = response.result.value as? [String:Any] else{
//                    return
//                }
//            print(json)
//            print(json["title"])
//            print("THIS IS THE BODY: ")
//            print(json["body"])
//        }
        
        

        let newPost: [String: Any] = ["userId" : 12345, "title": "This is a POST request", "Body": "This reqeust is sent with Alamofire"]
        
        Alamofire.request(postsURLEndPoint, method: .post, parameters: newPost,
                          encoding: JSONEncoding.default)
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error")
                    print(response.result.error!)
                    return
                }
                // unwrap JSON
                guard let json = response.result.value as? [String: Any] else {
                    print("No JSON")
                    // Could not get JSON
                    return
                }
                // use json
                guard let postTitle = json["title"] as? String else {
                    // Could not get title from json
                    print("as")
                    return
                }
                print("Post title: " + postTitle)
        }
    
    
    }
}

