//
//  LocationObserver.swift
//  LocationObserverTest
//
//  Created by Daisuke TONOSAKI on 2019/10/14.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//
//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/get_location_api.php?name=hijiri&pass=55itolab!!

//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/send_location_api.php?user_id=2&pass=55itolab!!&x_coordinate=55&y_coordinate=55

import Foundation
import CoreLocation
import Combine

class LocationObserver: NSObject, ObservableObject, CLLocationManagerDelegate {

  @Published private(set) var location = CLLocation()
  @Published private(set) var locations_ : [UserLocation] = []
 

  
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
    
    /*
      let url = URL(string: "http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/send_location_api.php?user_id=2&pass=55itolab!!&x_coordinate=56&y_coordinate=56")!
      
      URLSession.shared.dataTask(with: url) { data, response, error in
    
      }.resume()*/

  }
  
}



