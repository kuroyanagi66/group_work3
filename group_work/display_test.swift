//
//  display_test.swift
//  group_work
//
//  Created by itolab on 2020/06/22.
//  Copyright © 2020 kute. All rights reserved.
//

import SwiftUI

struct display_test: View {
    @State var isActivateSubView = true
    var body: some View {
      NavigationView {
          // NOTE: NavigationLinkはNavigationViewの内側でなければならない
        NavigationLink(destination: display1(),isActive:  $isActivateSubView) {
              // NOTE: Labelを指定すると遷移先へのリンクが自動的に生成される
              Text("Noe loading...")
          }
      }
    }
}

struct display_test_Previews: PreviewProvider {
    static var previews: some View {
        display_test()
    }
}
