//
//  display1.swift
//  group_work
//
//  Created by itolab on 2020/06/16.
//  Copyright © 2020 kute. All rights reserved.
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
    @ObservedObject var locationObserver = LocationObserver()

    
    var body: some View {
        NavigationView{
           
        VStack{
//Text(self.login_text.lonin_text1)
            
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
            }
            
            
            HStack{
                NavigationLink(destination: MapTest()) {
                                               EmptyView()
                               }.sheet(isPresented: $isActiveSubView) {
                                   MapTest()
                               }
                
                
                
                   Button(action:{
                    self.isActiveSubView.toggle()
                   }){
                    Image(systemName: "map").resizable()
                    .frame(width: 20.0, height: 20.0, alignment: .leading)
                }
                
            TextField("message", text: $inputText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(maxWidth: 280)
                
                Button(action:{self.inputText=""}){
                Image(systemName: "paperplane").resizable()
                .frame(width: 20.0, height: 20.0, alignment: .leading)
            }
            }
        }.navigationBarTitle("")
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
