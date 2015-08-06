//
//  AddItemController.swift
//  ToDoDemo
//
//  Created by apple on 15/8/3.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

import UIKit

class AddItemController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let footView = UIView(frame: CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width,  44))
        let saveBtn = UIButton(frame: CGRectMake(0, 0, footView.frame.size.width, footView.frame.size.height))
        
        saveBtn.backgroundColor = UIColor.orangeColor()
        saveBtn.setTitle("保存数据", forState: UIControlState.Normal)
        footView.addSubview(saveBtn)
        self.view.addSubview(footView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
