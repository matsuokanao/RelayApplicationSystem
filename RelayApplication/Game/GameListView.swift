//
//  GameListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/31.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct GameListView: View {
    @ObservedObject var data = getGameCompleteList()
    @State var email = ""
    @State var pass =   ""
    var body: some View {
         ZStack{
               Color("blue2")
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
            .background(Color("blue2"))
                
                Text("ユーザーパス")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

                TextField("ユーザーパス", text: self.$pass)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("blue2"))

                ForEach(self.data.data,id: \.id){i in
                    CellGameListView(completedata: i, pass: self.pass, email: self.email)
                }
            }.frame(width: 300, height: 600)
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}


 struct CellGameListView: View {
    var completedata : gamecomplete
    var pass : String
    var email : String
    @State var show = false
     var body: some View {
         VStack{
            if completedata.email == email && completedata.userpass ==  pass{
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.white)
                            Text(completedata.gamename)
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                                        Spacer()
                            Button(action: {
                                    self.show.toggle()
                                                }) {
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.white)
                                            }.sheet(isPresented: self.$show) {

                                                    GameShowListView(completedata: self.completedata)
                        
                    }
                }.padding(.top,20)
            }
        }
    }
 }

struct GameShowListView: View {
   var completedata : gamecomplete
    @State var show = false
    @State var showingAlert = false
    
    
    var body: some View {
        VStack{
            
            Group{
            Text("試合名")
            Text(completedata.gamename)
            Text("開催都道府県")
            Text(completedata.place)
            Text("試合会場")
            Text(completedata.gamevenue)
            Text("名前")
            Text(completedata.username)
            Text("登録陸連")
            Text(completedata.jaaf)
            }
            Text("所属名")
            Text(completedata.belong)
            Text("参加種目")
            Text(completedata.event1)
            Text(completedata.event2)
            Text(completedata.event3)
            if completedata.pay == "true" {
                Text("試合費用の確認ができました。")
                            } else{
                Text("試合費用のお支払いが完了していません。")
                Text("お支払いが確認できない場合は自動キャンセルとなります。")
                
            }
        }
    }
}
