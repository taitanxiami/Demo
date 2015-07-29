//
//  SHTodoModel.swift
//  ToDoDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

import UIKit

class SHTodoModel: NSObject {
   
    var id : String
    var title : String
    var image : String
    var date : String
    
    //初始化
    init (id : String ,title : String,image:String,date:String) {
        self.id = id
        self.title = title
        self.image = image
        self.date = date
    }
}
