
//
//  MapView.swift
//  LocationObserverTest
//
//  Created by Daisuke TONOSAKI on 2019/10/14.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  var coordinate: CLLocationCoordinate2D
    @ObservedObject var locationObserver = LocationObserver()
    @State var user_locations: [UserLocation] = []
    @State var x = 34.90408631044897
    @State var y = 138.1713600122716
  
    
  func makeUIView(context: Context) -> MKMapView {
  
 
    MKMapView(frame: .zero)
    
  }
  
  func updateUIView(_ view: MKMapView, context: Context) {
    
  
    let url_: URL = URL(string: "http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/get_location_api.php?name=hijiri&pass=55itolab!!")!
    let task: URLSessionTask = URLSession.shared.dataTask(with: url_, completionHandler: {(data, response, error) in
       
        self.user_locations = try! JSONDecoder().decode([UserLocation].self, from: data!)

    }
       )
 
    let num = self.user_locations.count
    var count = 0
    
    print(num)
    while count<num{
        
        //let coordinate =
           // CLLocationCoordinate2DMake(34.90408631044897, 138.1713600122716)
       
   
        
        let aaa = Double(self.user_locations[count].x_coordinate) ?? 0.0
        
         let bbb = Double(self.user_locations[count].y_coordinate) ?? 0.0
        let coordinate =  CLLocationCoordinate2DMake(34.954049304346465, 137.19134978634974)
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        view.removeAnnotations(view.annotations)
        
        let annotation = MKPointAnnotation()
        annotation.title = "2"
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
        
        
        count = count + 1
    }
    
    

    let coordinate = self.locationObserver.location.coordinate
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    view.setRegion(region, animated: true)
    view.removeAnnotations(view.annotations)
    
    let annotation = MKPointAnnotation()
    annotation.title = "I"
    annotation.coordinate = coordinate
    view.addAnnotation(annotation)
    
    
    /*
    let coordinate2 = CLLocationCoordinate2DMake(34.90408631044897, 138.3713600122716)
      let annotation2 = MKPointAnnotation()
       let span2 = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
       let region2 = MKCoordinateRegion(center: coordinate2, span: span2)

       annotation2.coordinate = coordinate2
    
       view.addAnnotation(annotation2)
       view.setRegion(region2, animated: true)*/
    
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2DMake(34.90408631044897, 138.1713600122716))
  }
}

/*
import SwiftUI
import MapKit

struct MapTest: View {
    @ObservedObject var locationObserver = LocationObserver()
    var body: some View {
        VStack{
         
            Text("　")
        MapView()
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        
   
        let coordinate = CLLocationCoordinate2D(
            latitude: 35.655164046, longitude: 139.740663704)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

/*
struct MapView: UIViewRepresentable {
  var coordinate: CLLocationCoordinate2D
  
  func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: .zero)
  }
  
  func updateUIView(_ view: MKMapView, context: Context) {
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    view.setRegion(region, animated: true)
    view.removeAnnotations(view.annotations)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    view.addAnnotation(annotation)
  }
}*/

struct MapTest_Previews: PreviewProvider {
    static var previews: some View {
        MapTest()
    }
}
*/


struct UserLocation: Decodable, Identifiable {
    var id: String
    var user_name: String
    var message: String
    var time: String
    var x_coordinate: String
    var y_coordinate: String
    
   // var login: String
    //var user_name: String
}
