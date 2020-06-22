//
//  display_map.swift
//  group_work
//
//  Created by itolab on 2020/06/21.
//  Copyright © 2020 kute. All rights reserved.
//

import SwiftUI
import MapKit

struct display_map: View {
     @ObservedObject var locationObserver = LocationObserver()
    
    var body: some View {
        VStack{
        Text("Clutch Map")
           //  MapView(coordinate:CLLocationCoordinate2DMake(34.90408631044897, 138.1713600122716))
        MapView(coordinate: self.locationObserver.location.coordinate)
    }
    }
}

struct display_map_Previews: PreviewProvider {
    static let login_text = Login_text()
    static var previews: some View {
        display_map().environmentObject(login_text)
    }
}
