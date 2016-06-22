//
//  Functions.swift
//  MyLocations
//
//  Created by Ike Mattice on 6/22/16.
//  Copyright © 2016 Ike Mattice. All rights reserved.
//

import Foundation
import Dispatch

func afterDelay(seconds: Double, closure: Void -> Void) {
    let when = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(when, dispatch_get_main_queue(), closure)
}