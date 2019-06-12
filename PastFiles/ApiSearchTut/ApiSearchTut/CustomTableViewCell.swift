//
//  CustomTableViewCell.swift
//  ApiSearchTut
//
//  Created by Ali Malik on 5/13/19.
//  Copyright © 2019 Malik Studios. All rights reserved.
//


import UIKit



class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wikiImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


