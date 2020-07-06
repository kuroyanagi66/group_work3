//
//  ContentView.swift
//  group_work
//
//  Created by itolab on 2020/06/16.
//  Copyright © 2020 kute. All rights reserved.
//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api.php?name=kuroyanagi&pass=55itolab!!
//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/talk_api.php?name=hijiri&pass=55itolab!!

import SwiftUI


import SwiftUI

struct ContentView: View {
    @State var inputID: String = ""
    @State var inputPassword: String = ""
    @State var id_text: String =
    "http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/login_api.php?name="

    @State var pass_text: String = "&pass="
    @State var login_info: String = ""
    @EnvironmentObject var login_text: Login_text
    @State var isActiveSubView = false
    @ObservedObject var store = FollowingUserStore(moji2:Login_text().lonin_text1)
    @State private var showingAlert = false
    @State var login_kyoka = 0
    @State var url_1 = "tem"
    @State var encodeUrlString = "s"
   // @ObservedObject var locationObserver = LocationObserver()
    @State var login_user1: [LoginUser] = []
    @State var hantei = false

   // @ObservedObject var user_login = FollowingUserStore2()
    
        var body: some View {
            
            
            
            
            NavigationView {
                
       
                
                
                VStack(alignment: .center) {
                    
                    
                    /*
                    NavigationLink(destination: //display1().environmentObject(login_text
                                                 display_tab().environmentObject(login_text)
                        ,isActive: $hantei
                                             ) {
                                                EmptyView()
                    }.onAppear(perform: {
                        
                        
                        if self.inputID != "" {
                            if self.login_text.kousin == true{
                                
                                self.hantei = true
                                self.login_text.kousin = false
                                
                            }
                        }
                                                 // do something
                                                // self.login_text.kousin = false
                                             })
           */
                 
                    
                    Text("Clutch")
                        
                        .font(.system(size: 45
                                      )).fontWeight(.heavy)
                    Image(systemName: "ellipses.bubble").resizable()
                        .frame(width: 55.0, height: 55.0, alignment: .leading)
                    HStack{
                        Image(systemName: "hare").resizable()
                                          .frame(width: 70.0, height: 50.0, alignment: .leading)
                        Image(systemName: "tortoise").resizable()
                                          .frame(width: 70.0, height: 40.0, alignment: .leading)
                    }
                    
                    VStack(spacing: 24) {
                        
                        TextField("ID", text: $inputID)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 280)

                        SecureField("Password", text: $inputPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 280)

                    }
                    .frame(height: 200)
          

                    NavigationLink(destination: //display1().environmentObject(login_text)
                        display_tab().environmentObject(login_text)
                        ,isActive: $isActiveSubView
                    ) {
                                    EmptyView()
                    }
                    

                    Button(action: {
                        
                        
                            
            
                    
                        //
                        
                        self.showingAlert = false
                        self.login_kyoka = 0
                       print("Login処理")
                        self.login_info = self.id_text + self.inputID + self.pass_text + self.inputPassword
                        self.login_text.lonin_text1 = self.inputID////
                        
                     
                        self.url_1 = self.login_info
                    
                        
                        self.encodeUrlString = self.url_1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        
                       // self.login_text.lonin_url1 = self.encodeUrlString
                       // self.login_text.lonin_url1 = self.encodeUrlString
                        
                        let url_: URL = URL(string: self.encodeUrlString)!
                        
                    
                      //  let url_: URL = URL(string: self.login_info)!
                        let task: URLSessionTask = URLSession.shared.dataTask(with: url_, completionHandler: {(data, response, error) in
                            
                            // コンソールに出力
                            //print("data: \(String(describing: data))")
                            //print("response: \(String(describing: response))")
                           // print("error: \(String(describing: error))")
                            if response?.expectedContentLength == 0{
                                print("ログイン失敗")
                                 self.showingAlert = true
                               
                                
                            }else{
                                
                                
                               // DispatchQueue.main.async {
                                    self.login_user1 = try!
                                        
                                        JSONDecoder().decode([LoginUser].self, from: data!)
                               // }
                                
                                print(self.login_user1[0].user_id)
                                self.login_text.login_id_kioku = self.login_user1[0].user_id
                                self.login_text.login_user_name = self.login_user1[0].user_name
                            self.isActiveSubView.toggle()
                                
                                
                            }
                        })
                        task.resume()
                        
                        if self.login_kyoka == 0{
                   // self.isActiveSubView.toggle()
                        }
                       // self.isActiveSubView.toggle()
                        /*
                        for i in self.store.users{
                            //print(i.user_name)
                            if i.user_name == self.inputID{
                                self.isActiveSubView.toggle()
                                self.login_kyoka = 1
                            }
                            
                        }
                        if self.login_kyoka == 0{
                        self.showingAlert = true
                        }*/
                    },
                    label: {
                        Text("Login")
                            .fontWeight(.medium)
                            .frame(minWidth: 160)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }).alert(isPresented: $showingAlert) {
                        Alert(title: Text("ログイン失敗"))}

                    
                    
                    
                    Spacer()
                   // Text(self.login_text.lonin_text1)
                }
            }
            
            
        }


    }




struct ContentView_Previews: PreviewProvider {
    static let login_text = Login_text()
    static var previews: some View {
        ContentView().environmentObject(login_text)
    }
}



struct LoginUser: Decodable {

    var user_name: String
    var user_id: String
   // var id:Int

}



