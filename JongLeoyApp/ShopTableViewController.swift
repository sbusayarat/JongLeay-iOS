//
//  ShopTableViewController.swift
//  JongLeoyApp
//
//  Created by Jessica Chayavichitsilp on 1/17/16.
//  Copyright © 2016 Jessica Chayavichitsilp. All rights reserved.
//

import UIKit

class ShopTableViewController: UITableViewController {

    // Mark:Properties
    var shops: [Shop] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSampleData()
        loadRealData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadSampleData() {
        let photo1 = UIImage(named: "defaultPhoto")!
        let shop1 = Shop(
            name: "ANONYMOUS",
            address: "ANONYMOUS",
            photo: photo1,
            category: "ANONYMOUS")
        
        shops += [shop1, shop1]
    }
    
    func loadRealData() {
        let area = "seattle"
        let url = NSURL(string: "http://jongleay-service-dev.elasticbeanstalk.com/restaurants?area=\(area)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.shopsJsonDeserializer(data!)
                self.tableView.reloadData()
            })
        }
        
        task.resume()
    }
    
    func shopsJsonDeserializer(data: NSData) {
        do {
            let parsedObject: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data,
                    options: NSJSONReadingOptions.AllowFragments)
            
                if let shopLists = parsedObject as? NSArray {
                    for shop in shopLists {
                        let name = shop["name"] as! String
                        let address = shop["address"] as! String
                        let imageUrl = shop["imageUrl"] as! String
                        let category = shop["category"] as! String
                        
                        let url = NSURL(string:imageUrl)
                        let contentUrl = NSData(contentsOfURL:url!)
                        let image = UIImage(data:contentUrl!)!
                        
                        let shopInfo = Shop(
                            name: name,
                            address: address,
                            photo: image,
                            category: category)
                        
                        shops += [shopInfo]
                    }
                }
        } catch _ {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return shops.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ShopTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ShopTableViewCell
        
        // Fetches the appropriate shop for the data source layout.
        let shop = shops[indexPath.row]
        
        cell.shopNameLabel.text = shop.name
        cell.shopImageView.image = shop.photo
        cell.shopAddressLabel.text = shop.address
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
