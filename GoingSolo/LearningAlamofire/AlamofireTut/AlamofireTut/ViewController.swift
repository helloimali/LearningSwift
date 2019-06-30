//
//  ViewController.swift
//  AlamofireTut
//
//  Created by Ali Malik on 6/29/19.
//  Copyright © 2019 Malik Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    private let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func renReq(_ sender: Any) {
        
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts") else{ return }
        
        networkingClient.executeTUT(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
    //https://jsonplaceholder.typicode.com/posts
}

