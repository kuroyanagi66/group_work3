//
//  LocationObserver.swift
//  LocationObserverTest
//
//  Created by Daisuke TONOSAKI on 2019/10/14.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//
//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/get_location_api.php?name=hijiri&pass=55itolab!!



import Foundation
import CoreLocation
import Combine

class LocationObserver: NSObject, ObservableObject, CLLocationManagerDelegate {
  @Published private(set) var location = CLLocation()
  
  private let locationManager: CLLocationManager
  
  override init() {
    self.locationManager = CLLocationManager()
    
    super.init()
    
    self.locationManager.delegate = self
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
  }
  
  func locationManager(_: CLLocationManager, didUpdateLocations: [CLLocation]) {
    
    

   
    
    
    location = didUpdateLocations.last!
    
    print(location.coordinate)
  }
  
}



