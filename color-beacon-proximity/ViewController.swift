//
//  ViewController.swift
//  closest-beacon-app
//
//  Created by Michael Douglas on 11/12/17.
//  Copyright © 2017 Michael Douglas Fullstack Academy. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")! as UUID, identifier: "Estimotes")
    let colors = [
        37126: UIColor(red: 84/255, green: 77/255, blue: 160/255, alpha: 1),
        //should be mintgit
        35008: UIColor(red: 142/255, green: 212/255, blue: 220/255, alpha: 1),
        //should be blueberry pie
        6933: UIColor(red: 162/255, green: 213/255, blue: 181/255, alpha: 1)
        //should be ice
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self;
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeacons(in: region)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.unknown }
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            self.view.backgroundColor = self.colors[closestBeacon.minor.intValue]
        }
        print(beacons)

    }


}

