//
//  LocationsViewController.swift
//  MyLocations
//
//  Created by Ike Mattice on 6/24/16.
//  Copyright © 2016 Ike Mattice. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class LocationsViewController: UITableViewController {
    var managedObjectContext: NSManagedObjectContext!
    var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //build the request
        let getLocations = NSFetchRequest()
        
        let entity = NSEntityDescription.entityForName("Location", inManagedObjectContext: managedObjectContext)
        
        getLocations.entity = entity
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        getLocations.sortDescriptors = [sortDescriptor]
        //finish building request
        //now use that request to find us some locations
        do {
            let foundObjects = try managedObjectContext.executeFetchRequest(getLocations)
            
            locations = foundObjects as! [Location]
        } catch {
            fatalCoreDataError(error)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditLocation" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! LocationDetailViewController
            controller.managedObjectContext = managedObjectContext
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                let location = locations[indexPath.row]
                controller.locationToEdit = location
            }
        }
    }
    
//MARK: UITableViewDataSource
    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    override func tableView(tableView: UITableView, 
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell", forIndexPath: indexPath) as! LocationCell
        let location = locations[indexPath.row]
        cell.configureForLocation(location)
        
        return cell
    }
}
