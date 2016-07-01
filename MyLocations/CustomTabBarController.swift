//
//  CustomTabBarController.swift
//  MyLocations
//
//  Created by Ike Mattice on 7/1/16.
//  Copyright © 2016 Ike Mattice. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        return nil
    }
}

