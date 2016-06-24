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
    
//MARK: UITableViewDataSource
    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    override func tableView(tableView: UITableView, 
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell", forIndexPath: indexPath)
        let location = locations[indexPath.row]
        
        let descriptionLabel = cell.viewWithTag(100) as! UILabel
        descriptionLabel.text = location.locationDescription
        
        let addressLabel = cell.viewWithTag(101) as! UILabel
        if let placemark = location.placemark {
            var text = ""
            if let s = placemark.subThoroughfare {
                text += s + " "
            }
            if let s = placemark.thoroughfare {
                text += s + ", "
            }
            if let s = placemark.locality {
                text += s
            }
            addressLabel.text = text
        } else {
            addressLabel.text = ""
        }
        
        return cell
    }
}
