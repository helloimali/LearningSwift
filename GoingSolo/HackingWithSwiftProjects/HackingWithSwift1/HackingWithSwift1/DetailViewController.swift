//
//  DetailViewController.swift
//  HackingWithSwift1
//
//  Created by Ali Malik on 8/4/19.
//  Copyright © 2019 Malik Studios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImg: String?
    var totalPics: Int = 0
    var indexPic: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Picture " + String(indexPic) + " of " + String(totalPics)
        //title = selectedImg
        
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
        if let imgToLoad = selectedImg{
            imageView.image = UIImage(named: imgToLoad)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPic = indexPath.row
        indexPic += 1
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
