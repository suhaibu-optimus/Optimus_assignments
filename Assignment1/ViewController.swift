//
//  ViewController.swift
//  Assignment1
//
//  Created by Suhaib Umar on 4/12/16.
//  Copyright © 2016 Suhaib. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var data: NSArray?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //assign the delegates and datasource to self
        table.delegate = self
        table.dataSource = self
        
        //load data from data.plist into data array
        if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist") {
            data = NSArray(contentsOfFile: path)
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (data?.count)!;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = table.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        //cell text properties
        cell.textLabel?.text = (data?.objectAtIndex(indexPath.row) as! String)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        cell.textLabel?.textColor = UIColor.blueColor()
        return cell
        
    }
    
   
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension;
        
    }
}

