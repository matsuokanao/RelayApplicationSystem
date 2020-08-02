//
//  RelayApplicationView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayApplicationView: View {
    @ObservedObject var gamedata = getGamedataList()
    @State var place = ""
    var body: some View {
        ZStack{
                Color("yello1")
                    .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading){
                    ScrollView(.vertical){
                    Text("参加したい試合の都道府県を入力して下さい")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                
                    TextField("", text: self.$place)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("yello1"))
                   
                        ForEach(self.gamedata.data,id: \.id){i in

                                CellRelayApplicationView(gamedata: i, place: self.place)
                                }.padding(.top,20)
                            }.frame(width: 300, height: 600)
                        }
                    }
            }
        }

struct RelayApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        RelayApplicationView()
    }
}



struct CellRelayApplicationView: View {
    var gamedata : gamelist
    var place : String
    @State var show = false
    var body: some View {
        VStack{
            if gamedata.place == self.place && gamedata.relay == "はい"{
                    VStack{
                                WebView(loadUrl: self.gamedata.png).frame(height: 400)
                        HStack{
                            VStack(alignment: .leading){
                                Text(gamedata.gamename).fontWeight(.heavy).font(.body)

                                    Text(gamedata.place).fontWeight(.heavy).font(.body)
                                
                                        }
                                        Spacer()
                                        Button(action: {
                                    self.show.toggle()
                                        }) {
                                                        
                                Image(systemName: "arrow.right")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .padding(14)
                                                    
                                }.background(Color("yello1"))
                                    .clipShape(Circle())
                                                    
                                }.padding(.horizontal)
                                    .padding(.bottom,6)
                                                    
                                }.background(Color.white)
                                .cornerRadius(20)
                                .sheet(isPresented: self.$show) {
                                  Spacer()
                                    GameApplicationListView(gamedata: self.gamedata)
                        }
                    }
                }
            }
        }

