//
//  Common.swift
//  ToDoDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

import Foundation

func dateFromString(dateString:String) ->NSDate? {
    
    let dataFommater = NSDateFormatter();
    dataFommater.dateFormat = "yyyy-MM-dd"
    let date = dataFommater.dateFromString(dateString)
    
    return date
}