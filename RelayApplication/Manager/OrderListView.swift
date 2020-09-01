//
//  OrderListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct OrderListView: View {
    @ObservedObject var gamedata = getGamedataList()
    @State var num = ""
    @State var pass = ""
    var body: some View {
        VStack{
            ZStack{
                Color("green5")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    ScrollView{
                        Text("当日オーダーリスト")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        Text("試合の団体番号と団体パスワードを入力して下さい")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.top,20)
                        
                        Text("団体番号")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.top,20)
                        
                        
                        TextField("", text: self.$num)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("green5"))
                        Text("団体パスワード")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                        
                        TextField("", text: self.$pass)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("green5"))
                        
                        ForEach(self.gamedata.data,id: \.id){i in
                            CellOrderListView(gamedata: i, num: self.num, pass: self.pass)
                        }
                    }
                }.frame(width: 300, height: 500)
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}

struct CellOrderListView: View {
    var gamedata : gamelist
    var num : String
    var pass : String
    @State var show = false
    
    var body: some View {
        VStack{
            if gamedata.groupnum == num && gamedata.grouppass == pass && gamedata.relay == "はい" && gamedata.end == "false"{
                HStack {
                    Image(systemName: "circle.fill")
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
                        OrderListEventView(gamedata: self.gamedata,num : self.num,pass:self.pass)
                    }
                }
            }
        }
    }
}


struct OrderListEventView :View {
    var gamedata : gamelist
    var num : String
    var pass : String
    @State var event = ""
    @State var show = false
    
    var body: some View {
        List{
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green5"))
                Text("男子4*100mR")
                    .foregroundColor(Color.blue)
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green5"))
                }.sheet(isPresented: self.$show) {
                    OrderListSelectView(gamedata: self.gamedata, num: self.num, pass: self.pass, event: "男子4*100mR")
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green5"))
                Text("女子4*100mR")
                    .foregroundColor(Color.red)
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green5"))
                }.sheet(isPresented: self.$show) {
                    OrderListSelectView(gamedata: self.gamedata, num: self.num, pass: self.pass, event: "女子4*100mR")
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green5"))
                Text("男子4*400mR")
                    .foregroundColor(Color.blue)
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green5"))
                }.sheet(isPresented: self.$show) {
                    OrderListSelectView(gamedata: self.gamedata, num: self.num, pass: self.pass, event: "男子4*400mR")
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green5"))
                Text("女子4*400mR")
                    .foregroundColor(Color.red)
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green5"))
                }.sheet(isPresented: self.$show) {
                    OrderListSelectView(gamedata: self.gamedata, num: self.num, pass: self.pass, event: "女子4*400mR")
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green5"))
                Text("男女混成4*400mR")
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green5"))
                }.sheet(isPresented: self.$show) {
                    OrderListSelectView(gamedata: self.gamedata, num: self.num, pass: self.pass, event: "男女混成4*400mR")
                }
            }
        }
    }
    
    struct OrderListSelectView: View {
        @ObservedObject var ordercomplete = getOrderCompleteList()
        var gamedata : gamelist
        var num : String
        var pass : String
        var event :String
        @State var show = false
        var body: some View {
            List{
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("green5"))
                    Text("1組目")
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green5"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.ordercomplete.data,id: \.id){i in
                            OrderListShowView(ordercomplete: i, gamedata: self.gamedata, name: "1",num: self.num,pass : self.pass, event: self.event)
                        }
                    }
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("green5"))
                    Text("2組目")
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green5"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.ordercomplete.data,id: \.id){i in
                            OrderListShowView(ordercomplete: i, gamedata: self.gamedata, name: "2",num: self.num,pass : self.pass, event: self.event)
                        }
                    }
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("green5"))
                    Text("3組目")
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green5"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.ordercomplete.data,id: \.id){i in
                            OrderListShowView(ordercomplete: i, gamedata: self.gamedata, name: "3",num: self.num,pass : self.pass, event: self.event)
                        }
                    }
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("green5"))
                    Text("4組目")
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green5"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.ordercomplete.data,id: \.id){i in
                            OrderListShowView(ordercomplete: i, gamedata: self.gamedata, name: "4",num: self.num,pass : self.pass, event: self.event)
                        }
                    }
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("green5"))
                    Text("5組目")
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green5"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.ordercomplete.data,id: \.id){i in
                            OrderListShowView(ordercomplete: i, gamedata: self.gamedata, name: "5",num: self.num,pass : self.pass, event: self.event)
                        }
                    }
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("green5"))
                    Text("6組目")
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green5"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.ordercomplete.data,id: \.id){i in
                            OrderListShowView(ordercomplete: i, gamedata: self.gamedata, name: "6",num: self.num,pass : self.pass, event: self.event)
                        }
                    }
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("green5"))
                    Text("7組目")
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green5"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.ordercomplete.data,id: \.id){i in
                            OrderListShowView(ordercomplete: i, gamedata: self.gamedata, name: "5",num: self.num,pass : self.pass, event: self.event)
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    struct OrderListShowView: View {
        var ordercomplete : ordercomplete
        var gamedata : gamelist
        var name : String
        var num : String
        var pass : String
        @State var show = false
        var event :String
        var body: some View {
            VStack{
                if ordercomplete.pay == "true" && ordercomplete.groupnum == num && ordercomplete.grouppass == pass &&   ordercomplete.gamename == gamedata.gamename && ordercomplete.event == event && ordercomplete.set == name {
                    VStack{
                        Text(ordercomplete.event)
                            .fontWeight(.bold)
                            .padding(.top,10)
                            .foregroundColor(Color("green5"))
                        HStack{
                            Text(ordercomplete.set)
                                .fontWeight(.bold)
                                .foregroundColor(Color("green5"))
                            Text("組")
                                .fontWeight(.bold)
                                .foregroundColor(Color("green5"))
                            Text(ordercomplete.lanes)
                                .fontWeight(.bold)
                                .foregroundColor(Color("green5"))
                            Text("レーン")
                                .fontWeight(.bold)
                                .foregroundColor(Color("green5"))
                        }
                        Text(ordercomplete.belong)
                            .fontWeight(.bold)
                            .foregroundColor(Color("green5"))
                        HStack{
                            Text("1走")
                            Text(ordercomplete.order1)
                        }
                        HStack{
                            Text("2走")
                            Text(ordercomplete.order2)
                        }
                        HStack{
                            Text("3走")
                            Text(ordercomplete.order3)
                        }
                        
                        HStack{
                            Text("4走")
                            Text(ordercomplete.order4)
                        }
                    }
                }
            }
        }
    }
}
