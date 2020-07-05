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
     @State var user_locations: [User] = []
     @ObservedObject var store2 = FollowingUserStore2()
     @EnvironmentObject var login_text: Login_text
   
    
    
    var body: some View {
        
        
        VStack{
            
            
           
  
            List(store2.locations) { (user) in
                    
                Text(user.x_coordinate)
                                   
            }
            

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


