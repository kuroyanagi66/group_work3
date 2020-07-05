
//
//  MapView.swift
//  LocationObserverTest
//
//  Created by Daisuke TONOSAKI on 2019/10/14.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//
//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/get_location_api.php?name=kuroyanagi&pass=55itolab!!


//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/send_location_api.php?user_id=2&pass=55itolab!!&x_coordinate=90&y_coordinate=90

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  var coordinate: CLLocationCoordinate2D
    @ObservedObject var locationObserver = LocationObserver()
    @State var user_locations: [UserLocation] = []
    @State var user: [User] = []
    @ObservedObject var store2 = FollowingUserStore2()
    @ObservedObject var store3 = FollowingUserStore3()
    @EnvironmentObject var login_text: Login_text
  
    
  func makeUIView(context: Context) -> MKMapView {
  
 
    MKMapView(frame: .zero)
    
  }
  
  func updateUIView(_ view: MKMapView, context: Context) {
    
    

    
  
    
    var count = 0
    print("user")
   
    /*
    for user in store2.locations {
        
        
        let aaa = Double(user.x_coordinate) ?? 0.0
        
        let bbb = Double(user.y_coordinate) ?? 0.0
        let coordinate =  CLLocationCoordinate2DMake(aaa, bbb)
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        view.removeAnnotations(view.annotations)
        
        let annotation = MKPointAnnotation()
        annotation.title = user.user_name
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
        print("count")
        print(aaa)
        print(bbb)
        
        count = count + 1
    }
    */
   
    
    
    let coordinate = self.locationObserver.location.coordinate
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    view.setRegion(region, animated: true)
    view.removeAnnotations(view.annotations)
    
    let annotation = MKPointAnnotation()
    annotation.title = self.login_text.login_user_name 
    annotation.coordinate = coordinate
    view.addAnnotation(annotation)
    
    

    
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2DMake(34.90408631044897, 138.1713600122716))
  }
}



