//
//  RelayListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayListView: View {
    @ObservedObject var data = getRelayCompleteList()
    @State var email = ""
    @State var pass =   ""
    var body: some View {
        ZStack{
                Color("yello3")
                        .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            Text("試合申し込み時に入力したユーザーパスとメールアドレスを入力して下さい")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

            Text("メールアドレス")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

            TextField("メールアドレス", text: self.$email)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("yello3"))
                        
            Text("ユーザーパス")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.top,20)

            TextField("ユーザーパス", text: self.$pass)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("yello3"))

        ForEach(self.data.data,id: \.id){i in
            CellRelayListView(relaylist: i, pass: self.pass, email: self.email)
                        }
                    }.frame(width: 300, height: 600)
                }
            }
        }


struct RelayListView_Previews: PreviewProvider {
    static var previews: some View {
        RelayListView()
    }
}



struct CellRelayListView: View {
    var relaylist : relaycomplete
    var pass : String
    var email : String
    @State var show = false
    var body: some View {
        VStack{
        if relaylist.email == email && relaylist.userpass == pass  {
            HStack {
                Image(systemName: "person.fill")
                        .foregroundColor(Color.white)
                Text(relaylist.gamename)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                                        Spacer()
            Button(action: {
                            self.show.toggle()
                                    }) {
                Image(systemName: "play.fill")
                        .foregroundColor(Color.white)
                        }.sheet(isPresented: self.$show) {

                            RelayShowListView(relaylist: self.relaylist)
                                   
                               }
                           }.padding(.top,20)
                       }
                   }
               }
            }


struct RelayShowListView: View {
   var relaylist : relaycomplete
    @State var show = false
    @State var showingAlert = false
        
    var body: some View {
        VStack{
            
            Group{
            Text("試合名")
            Text(relaylist.gamename)
            Text("開催都道府県")
            Text(relaylist.place)
            Text("試合会場")
            Text(relaylist.gamevenue)
            Text("名前")
            Text(relaylist.username)
            Text("登録陸連")
            Text(relaylist.jaaf)
            }
            Text("所属名")
            Text(relaylist.belong)
            Text("参加種目")
            if relaylist.pay == "true" {
                Text("試合費用の確認ができました。")
                            } else{
                Text("試合費用のお支払いが完了していません。")
                Text("お支払いが確認できない場合は自動キャンセルとなります。")
                
            }
        }
    }
}