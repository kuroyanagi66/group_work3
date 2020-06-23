//
//  display_tab.swift
//  group_work
//
//  Created by itolab on 2020/06/21.
//  Copyright © 2020 kute. All rights reserved.
//

import SwiftUI
import MapKit

struct display_tab: View {
    @EnvironmentObject var login_text: Login_text
    //@ObservedObject var locationObserver = LocationObserver()
    
    
    var body: some View {
        TabView{
            display1().tabItem{
                VStack{
                    Image(systemName: "bubble.left.and.bubble.right").resizable()
                    .frame(width: 3050, height: 35.0, alignment: .leading)
                Text("CHAT")
                }
                
            }
            //MapView(coordinate: self.locationObserver.location.coordinate).tabItem{Text("MAP")}
            MapView(coordinate: CLLocationCoordinate2DMake(34.90408631044897, 138.1713600122716))
                .tabItem{
                    VStack{
                        Image(systemName: "map").resizable()
                                           .frame(width: 3050, height: 35.0, alignment: .leading)
                    Text("MAP")
                    }
                    
            }
        }
    }
}

struct display_tab_Previews: PreviewProvider {
    static let login_text = Login_text()
    static var previews: some View {
        display_tab().environmentObject(login_text)
    }
}
//CLLocationCoordinate2DMake(34.90408631044897, 138.1713600122716)
