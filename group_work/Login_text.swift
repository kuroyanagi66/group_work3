//
//  Login_text.swift
//  group_work
//
//  Created by itolab on 2020/06/16.
//  Copyright © 2020 kute. All rights reserved.
//

import Foundation
import SwiftUI

class Login_text : ObservableObject {
    
    @Published var lonin_text1 = String()
  //  @Published var lonin_url1 = "http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/talk_api.php?name=hijiri&pass=55itolab!!"
    
    @Published var login_id_kioku = String()
    @Published var login_user_name = String()
    @Published var keido = Float()
    @Published var location_list: [UserLocation] = []
}
