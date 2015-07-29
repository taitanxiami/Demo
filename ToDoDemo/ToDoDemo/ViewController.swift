//
//  ViewController.swift
//  ToDoDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

import UIKit

 let cellIdentify = "todoCell"
var todos:[SHTodoModel] = []

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todos = [SHTodoModel(id: "1", title: "1.去旅游", image: "image", date:"2014-23-2" ),SHTodoModel(id: "2", title: "2.trave to beijing ", image: "image", date: "2023-3-34")]
        
        navigationItem.leftBarButtonItem = editButtonItem()
//        self.tableView.tableFooterView = UIView.alloc()
//        var view = UIView.alloc()
    }

    
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todos.count;
    }
    
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentify) as! SHToDoCell
    var todomodel =  todos[indexPath.row]
        cell.cellTitleLabel.text = todomodel.title
        cell.cellDateLabel.text = todomodel.date
        
        return cell;
        
    }
    
//添加删除功能
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            
            todos.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
        
    }
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }


}

