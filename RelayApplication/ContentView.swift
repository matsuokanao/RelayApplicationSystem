
//
//  ContentView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false

var body: some View {
    NavigationView{
                    
        VStack{
            
        //ログインしていたらHOMESCREENへ移動
            if self.status{
                TabView{
                    Homescreen(show: .constant(false))
                        .tabItem{ Text("HOME")}
                    RelayView()
                        .tabItem{Text("試合に申し込む")}
                    ManagerView()
                        .tabItem{Text("大会関係者ページ")}
                }
            } else {
        ZStack{
            
NavigationLink(destination: SingUpView(show: self.$show), isActive: self.$show){
                    Text("")
                            }.hidden()
                            LooginView(show: self.$show)
                        
                    }
                }
            }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .onAppear{
                    
                        NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main)   { (_) in
                            
                            self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

