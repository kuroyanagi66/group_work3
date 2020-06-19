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
