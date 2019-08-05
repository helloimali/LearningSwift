//
//  ViewController.swift
//  HackingWithSwift1
//
//  Created by Ali Malik on 8/4/19.
//  Copyright © 2019 Malik Studios. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Do any additional setup after loading the view.
        let fileMan = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileMan.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
               pictures.append(item)
            }
        }
        
        print(pictures)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    } //numberOfRowsInSection
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }//cellForRowAt
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImg = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    } // didSelectRowAt
    
    

}

