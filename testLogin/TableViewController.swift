//
//  TableViewController.swift
//  testLogin
//
//  Created by Kevin Koleck on 7/16/16.
//  Copyright © 2016 Kevin Koleck. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tableview: UITableView!
    
    struct Table_Data {
        var button:String = ""
        var major:String = ""
        var minor:String = ""
        
        init(){}
    }
    
    var TableData = Array <Table_Data>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        print("HERE")
        var new_elements:Table_Data
        
        new_elements = Table_Data()
        new_elements.button = "Tag"
        new_elements.major = "1"
        new_elements.minor = "1"
        TableData.append(new_elements)
        
        new_elements.button = "Tag"
        new_elements.major = "2"
        new_elements.minor = "2"
        TableData.append(new_elements)
        
        new_elements.button = "Tag"
        new_elements.major = "3"
        new_elements.minor = "3"
        TableData.append(new_elements)
        
//        get_data_from_url("http://www.kaleidosblog.com/tutorial/tutorial.json")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TableData.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        cell.MinorLabel.text = TableData[indexPath.row].minor
        cell.ButtonText.setTitle(TableData[indexPath.row].button, forState: UIControlState.Normal)
        cell.MajorLabel.text = TableData[indexPath.row].major
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetailSegue"
        {
            if let destinationVC = segue.destinationViewController as? DetailViewController{
                let indexPath = tableView.indexPathForSelectedRow?.row
                print(indexPath)
                
//                destinationVC.majorLabel.text = TableData[1].major
//                destinationVC.minorLabel.text = TableData[1].minor
                
                destinationVC.majorLabelText = TableData[indexPath!].major
                destinationVC.minorLabelText = TableData[indexPath!].minor
                
                
            }
        }
     }
    
    /*
    func get_data_from_url(url:String)
    {
        let url:NSURL = NSURL(string: url)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        
        let task = session.dataTaskWithRequest(request) {
            (
            let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.extract_json(data!)
                return
            })
            
        }
        
        task.resume()
    }
    
    func extract_json(jsonData:NSData)
    {
        let json: AnyObject?
        do {
            json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
        } catch {
            json = nil
            return
        }

        if let countries_list = json as? NSArray
        {
            for (var i = 0; i < countries_list.count ; i++ )
            {
                if let country_obj = countries_list[i] as? NSDictionary
                {
                    if let country_name = country_obj["country"] as? String
                    {
                        if let country_code = country_obj["code"] as? String
                        {
                            TableData.append(country_name + " [" + country_code + "]")
                        }
                    }
                }
            }
        }
        
        do_table_refresh();
    }
 */
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    
    
}
