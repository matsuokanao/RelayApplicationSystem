//
//  GameApplicationView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/29.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import WebKit

struct GameApplicationView: View {
    @ObservedObject var gamedata  = getGamedataList()
    @State var place = ""
    var body: some View {
        ZStack{
                Color("blue1")
                        .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            Text("参加したい試合の都道府県を入力して下さい")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
        
            TextField("", text: self.$place)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("blue1"))
           
                ForEach(self.gamedata.data,id: \.id){i in

                        CellGameApplicationView(gamedata: i, place: self.place)
                        }.padding(.top,20)
                    }.frame(width: 300, height: 600)
                }
            }
        }


struct GameApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        GameApplicationView()
    }
}


struct CellGameApplicationView: View {
    var gamedata : gamelist

    var place : String
    @State var show = false
var body: some View {
        VStack{
            if gamedata.place == self.place{
                VStack{
                        WebView(loadUrl: self.gamedata.png).frame(height: 400)
                HStack{
                    VStack(alignment: .leading){
                            Text(gamedata.gamename).font(.title).fontWeight(.heavy)
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
                                            
                        }.background(Color("blue1"))
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


struct GameApplicationListView: View {
    var gamedata : gamelist
    @State var show = false
    @State var event1 = ""
    @State var event2 = ""
    @State var event3 = ""
    //試合費用支払い状況
    @State var pay = "false"

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}






//WebKitの設定
struct WebView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}


    


