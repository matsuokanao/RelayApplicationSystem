//
//  EntryListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct EntryListView: View {
    
    @ObservedObject var gamedata = getGamedataList()
    @State var pass = ""
    @State var num = ""
    @State var finishshow = false
    
    var body: some View {
        ZStack{
        Color("green6")
            .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            ScrollView{
            Text("エントリーリスト")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)

                HStack{
                        Spacer()
                    Button(action: {
                            self.finishshow.toggle()
                                }) {
                        Text("試合を終了させる")
                            .fontWeight(.bold)
                            .foregroundColor(Color("blue1"))
                            .padding(.vertical)
                            .padding(.horizontal,10)
                            .background(Color.white)
                            .clipShape(Capsule())
                                    }.padding(.top,20)
                    .sheet(isPresented: self.$finishshow) {
                            ManagerEndView()
                        }
                }

                Text("試合の運営団体番号と運営団体パスワードを入力して下さい")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

                Text("運営団体番号")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

                               
                TextField("", text: self.$num)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("green6"))
            
                Text("運営団パスワード")
                .foregroundColor(Color.white)
                .fontWeight(.bold)

                               
                TextField("", text: self.$pass)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("green6"))

                        ForEach(self.gamedata.data,id: \.id){i in
                            CellEntryListView(gamedata:i,pass: self.pass, num: self.num)
                        }
                    }
                }.frame(width: 300, height: 500)
            }
        }
    }


struct EntryListView_Previews: PreviewProvider {
    static var previews: some View {
        EntryListView()
    }
}

struct CellEntryListView: View {
    @ObservedObject var completelist = getGameCompleteList()
    var gamedata : gamelist
    var pass : String
    var num : String
    @State var show = false
    var body: some View {
        VStack{
            if gamedata.grouppass == pass && gamedata.groupnum == num && gamedata.end == "false" {
                HStack {
                        Image(systemName: "person.fill")
                                .foregroundColor(Color.white)
                        Text(gamedata.gamename)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top,10)

                                            Spacer()
                    Button(action: {
                                    self.show.toggle()
                                                }) {
                        Image(systemName: "play.fill")
                                    .foregroundColor(Color.white)
                                                }.sheet(isPresented: self.$show) {
                                                    ForEach(self.completelist.data,id: \.id){i in
                                                    EntryShowListView(completedata: i,gamedata: self.gamedata)
                                        
                        }
                    }
                }
            }
        }
    }
}



struct EntryShowListView: View {
    
    var completedata :gamecomplete
    var gamedata : gamelist
    @State var show = false
    var body: some View {
        VStack{
            if completedata.pay == "true" && gamedata.gamename == completedata.gamename{
                Text(completedata.username)
            }
        }
    }
}
