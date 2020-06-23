//
//  display1.swift
//  group_work
//
//  Created by itolab on 2020/06/16.
//  Copyright © 2020 kute. All rights reserved.
//

//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/send_api.php?user_id=2&pass=55itolab!!&message=test&parent_id=0
//送信用↑↑

//

import SwiftUI
import Foundation
import CoreLocation
import Combine

//import KeyboardObserving

struct display1: View {

    
    @EnvironmentObject var login_text: Login_text
    @ObservedObject var store = FollowingUserStore(moji2:Login_text().lonin_text1) //Login_text().lonin_text1)
    @State var inputText: String  = ""
    @State var isActiveSubView = false
    @State var sousinn1 = "http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/send_message_api.php?user_id="
    
    @State var sousinn2 = "&pass=55itolab!!&message="
    @State var sousinn3 = "&parent_id=0"
    @State var sousinn_text = ""
   @ObservedObject var locationObserver = LocationObserver()
    @State private var selection = 1

  @State var user_names_list: [String] = []

    var body: some View {
        
      
        NavigationView{
            
      
        VStack{
            
         
    
//Text(self.login_text.lonin_text1)
//Text(self.login_text.login_id_kioku)
           // Text(self.login_text.lonin_text1)
            
            
         List(store.users) { (user) in
            //ForEach(store.users){ user in
             // UserRow(user: user)
                
                if user.user_name != self.login_text.lonin_text1{
              //   if user.user_name != "kuroyanagi"{
                    
                    UserRow(user: user)
                    
                }else{
                    UserRow2(user: user)
                }
            
            if self.isActiveSubView == true{
                Text("add")
                
            }
            }
            
            
            ///
            ForEach(store.users) { (user) in
               //ForEach(store.users){ user in
                // UserRow(user: user)
                   
                   if user.user_name != self.login_text.lonin_text1{
                 //   if user.user_name != "kuroyanagi"{
                       
                   
                       
                   }
         
               }
            ///
            
            
            HStack{
                /*
                NavigationLink(destination: display_test() ,isActive: $isActiveSubView ) {
                                               EmptyView().environmentObject(self.login_text)
                               }*/
             /*   .sheet(isPresented: $isActiveSubView) {
                                MapView(coordinate: self.locationObserver.location.coordinate)
                                //.environmentObject(self.login_text)
                               }
                */
                
                /*
                   Button(action:{
                    self.isActiveSubView.toggle()
                   }){
                    Image(systemName: "map").resizable()
                    .frame(width: 20.0, height: 20.0, alignment: .leading)
                }*/
                
                Button(action:{



                            }){
                             Image(systemName: "arrow.clockwise.circle").resizable()
                             .frame(width: 20.0, height: 20.0, alignment: .leading)
                         }
                
            TextField("message", text: $inputText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(maxWidth: 280)
                
                Button(action:{
                    
                    self.sousinn_text = self.sousinn1
                        + self.login_text.login_id_kioku + self.sousinn2 + self.inputText + self.sousinn3
                    
                    
                    
                    let encodeUrlString = self.sousinn_text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                    
                    let url_: URL = URL(string:encodeUrlString)!
                    let request = URLRequest(url: url_)
                    
                    
                    
                  //  UIApplication.shared.open(url_)
                    print(request)
                    
                    if self.inputText != ""{
                ////////////
            let task: URLSessionTask = URLSession.shared.dataTask(with: url_, completionHandler: {(data, response, error) in
            })
                    task.resume()
                    //////////////
                    }
                    
                    self.inputText=""
                }){
                Image(systemName: "paperplane").resizable()
                .frame(width: 20.0, height: 20.0, alignment: .leading)
            }
            }
         //   Text(self.sousinn_text)
            
                    
        }.navigationBarTitle("ss")
        .navigationBarHidden(true)
            
            
            
            
            
            
    
}

    }
struct UserRow: View {
    var user: User
    var body: some View {
        //Text(user.login)
        VStack(alignment: .leading){
        //Text(user.id + "\n" + user.user_name + "\n" + user.message)
            //+ "\n" + user.user_name )
           // Spacer()
            //Text(user.user_name).font(.system(size: 20))
            //Spacer()
           
             Text(user.user_name).font(.system(size: 20))
            HStack{
                
           // Spacer()
                
            
                   
                Image(systemName: "person.crop.circle").resizable()
                                   .frame(width: 35.0, height: 35.0, alignment: .leading)
                
                
                VStack{
                   // Text("　")
            ZStack{
            Rectangle().fill(Color.black).frame(width:200, height: 40).cornerRadius(15)
                
                Text(user.message).font(.system(size: 25
                          )).foregroundColor(.white)
                    }
                
                }
                Spacer()
            }
             Text(user.time).font(.system(size: 15))
            }
        }
    }
    
    struct UserRow2: View {
    var user: User
    var body: some View {
        //Text(user.login)
        VStack(alignment: .trailing){
        //Text(user.id + "\n" + user.user_name + "\n" + user.message)
            //+ "\n" + user.user_name )
                Text(user.user_name).font(.system(size: 20))
            
            HStack{
                
            
                Spacer()
               
                VStack{
          
            ZStack{
          
            Rectangle().fill(Color.green).frame(width:200, height: 40).cornerRadius(15)
                
                Text(user.message).font(.system(size: 25
                          ))
                }.foregroundColor(.white)
            }
               
                
                Image(systemName: "person.crop.circle").resizable()
                                                  .frame(width: 35.0, height: 35.0, alignment: .leading)
                    
    
              //  Spacer()
            }
            Text(user.time).font(.system(size: 15))
            }
        
        }
    }
    
}
struct display1_Previews: PreviewProvider {
 
    static let login_text = Login_text()
    static var previews: some View {
        display1().environmentObject(login_text)
    }
}


//最新
