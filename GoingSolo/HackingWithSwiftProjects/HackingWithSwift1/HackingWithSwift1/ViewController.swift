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
        
        
       
        for i in 0 ..< pictures.count{
            var min: Int! = i
            for x in i ..< pictures.count{
                if pictures[x] < pictures[min] {
                    min = x
                }
            }
            
            let temp = pictures[i]
            pictures[i] = pictures[min]
            pictures[min] = temp
        }
        // or you could have just done this
        //pictures.sort()
        
        
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
    
    
    // This func sends data to DetailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImg = pictures[indexPath.row]
            vc.totalPics = pictures.count
            vc.indexPic = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
        
    } // didSelectRowAt
    
    

}

