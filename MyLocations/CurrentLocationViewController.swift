//
//  FirstViewController.swift
//  MyLocations
//
//  Created by Ike Mattice on 6/16/16.
//  Copyright © 2016 Ike Mattice. All rights reserved.
//

import UIKit
import CoreLocation


class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var getButton: UIButton!
    
    let locationManager = CLLocationManager()
    
    //MARK: CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, 
                         didFailWithError error: NSError) {
        print("didFailWithError \(error)")
    }
    func locationManager(manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("didUpdateLocations \(newLocation)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getLocation() {
        print("oh hai")
        let authStatus = CLLocationManager.authorizationStatus()
        
        if authStatus == .NotDetermined { 
            locationManager.requestWhenInUseAuthorization() 
            return
        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
}

