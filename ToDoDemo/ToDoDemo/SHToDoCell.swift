//
//  SHToDoCell.swift
//  ToDoDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

import UIKit
class SHToDoCell: UITableViewCell {

    @IBOutlet weak var cellImageVIew: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
