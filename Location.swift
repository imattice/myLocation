//
//  Location.swift
//  MyLocations
//
//  Created by Ike Mattice on 6/23/16.
//  Copyright © 2016 Ike Mattice. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation
import MapKit

//func buildAddress(location: Location) -> String {
//    if let placemark = location.placemark {
//        var text = ""
//        if let s = placemark.subThoroughfare {
//            text += s + " "
//        }
//        if let s = placemark.thoroughfare {
//            text += s + ", "
//        }
//        if let s = placemark.locality {
//            text += s
//        }
//    }
//    return text
//}

class Location: NSManagedObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    var subtitle: String? {
        return category
    }

}
