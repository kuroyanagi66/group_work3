//
//  display_test.swift
//  group_work
//
//  Created by itolab on 2020/06/22.
//  Copyright © 2020 kute. All rights reserved.
//
//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/new_login_api.php?key=1324576890&name=DQN&mail=sss&pass=55

import SwiftUI

struct display_test: View {
        @State var inputEmail: String = ""
        @State var inputPassword: String = ""
        @State var inputName: String = ""
        @State private var showingAlert = false
        @State var yourtName: String = ""
    
    @State var text1 = "http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api/new_login_api.php?key=1324576890&name="

        var body: some View {
            NavigationView {
                VStack(alignment: .center) {
                    Text("Sign up")
                        .font(.system(size: 45,
                                      weight: .heavy))

                    VStack(spacing: 24) {
                        
                        TextField("User name", text: $inputName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)
                        
                        TextField("Mail address", text: $inputEmail)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 280)

                        TextField("Password", text: $inputPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 280)

                    }
                    .frame(height: 200)

                    Button(action: {
                        
                        
                       print("sign up処理")
                        
                        if self.inputEmail != "" {
                            if self.inputPassword != "" {
                                if self.inputName != "" {
                                    
                                    
                                    
                                    let url = self.text1 + self.inputName + "&mail=" + self.inputEmail + "&pass=" + self.inputPassword
                                    
                                    ///////////
                                    print(url)
                                    let encodeUrlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                                    let url_: URL = URL(string: encodeUrlString)!
                                                           
                                             
                                        let task: URLSessionTask = URLSession.shared.dataTask(with: url_, completionHandler: {(data, response, error) in
                                                               
                                               
                                    if response?.expectedContentLength == 0{
                                                                   print("ログイン失敗")
                                                        
                                                                  
                                                                   
                                                               }else{
                                                                   
                                                                   
                                                               }
                                                           })
                                                           task.resume()
      
                                    ///////////////
                                    self.yourtName = self.inputName
                                    self.inputEmail = ""
                                    self.inputPassword = ""
                                    self.inputName = ""
                                    self.showingAlert = true
                                }
                            }
                        
                        
                        }
                        
                        
                    },
                    label: {
                        Text("Register")
                            .fontWeight(.medium)
                            .frame(minWidth: 160)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                        
                    }).alert(isPresented: $showingAlert) {
                        Alert(title: Text("登録成功"),
                              message: Text(self.yourtName + "さん、ようこそ！"))   // 詳細メッセージの追加
                    }

                    Spacer()
                 
                }
            }
        }
    }


struct display_test_Previews: PreviewProvider {
    static var previews: some View {
        display_test()
    }
}
