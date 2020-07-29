//
//  MakeGameView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct MakeGameView: View {
    @ObservedObject var authority = getAuthorityList()
    @ObservedObject var data = getManagerList()
    var body: some View {
        VStack{
           ForEach(self.data.data,id: \.id){i in
            ForEach(self.authority.data,id: \.id){a in
            MakeGamCellView(managerdata: i, authoritydata: a)
                }
            }
        }
    }
}

struct MakeGameView_Previews: PreviewProvider {
    static var previews: some View {
        MakeGameView()
    }
}



struct MakeGamCellView: View {
    var managerdata : managerlist
    var authoritydata : authority
    @State var showAlert = false
    @State var gamename = ""
    @State var year = ""
    @State var month = ""
    @State var day = ""
    @State var place = ""
    @State var gamevenue = ""
    @State var png = ""
    @State var link = ""

    
    var body: some View {
        
        ZStack{
            if authoritydata.email == managerdata.email {
                                Color("green2")
                                    .edgesIgnoringSafeArea(.all)
                        //画面スクロール処理
                        ScrollView(.vertical){
                                
                            VStack(alignment: .leading, spacing: 25){
                                Group{
                                Text("試合を作成する")
                                    .fontWeight(.bold)
                                    .font(.system(size: 35, weight: .bold))
                                    .foregroundColor(.white)
                                Text("・作成した試合情報は試合関係者ページにて確認できます。")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 350, height: 60)
                                Group{
                                Text("試合名")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.top,10)
                                VStack{
                                    TextField("試合名", text: $gamename)
                                        .foregroundColor(.white)
                                        Divider()
                                            .background(Color.white)
                                        }
                                
                                Text("試合日程")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top,10)
                                HStack{
                                    TextField("例　2020", text: $year)
                                        .keyboardType(.numberPad)
                                        .foregroundColor(.white)
                                    Text("年")
                                        .foregroundColor(.white)
                                    TextField("例　10", text: $month)
                                        .keyboardType(.numberPad)
                                        .foregroundColor(.white)
                                    Text("月")
                                        .foregroundColor(.white)
                                    TextField("例　29", text: $day)
                                        .keyboardType(.numberPad)
                                        .foregroundColor(.white)
                                    Text("日")
                                        .foregroundColor(.white)

                                        Divider()
                                            .background(Color.white)
                                        }
                                
                                Text("開催都道府県")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top,10)
                                VStack{
                                    TextField("開催都道府県", text: $place)
                                        .foregroundColor(.white)
                                        Divider()
                                            .background(Color.white)
                                        }
                                
                                Text("試合会場")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top,10)
                                VStack{
                                    TextField("代表者名", text: $gamevenue)
                                        .foregroundColor(.white)
                                        Divider()
                                            .background(Color.white)
                                        }
                                    
                            
                                        Text("試合要項（PDFファイルを貼って下さい）")
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding(.top,10)
                                        VStack{
                                            TextField("試合要項画像のPDFをお貼り下さい", text: $png)
                                                .foregroundColor(.white)
                                            Divider()
                                                .background(Color.white)
                                           
                                    Text("大会ホームページのURLリンク(http://.....)")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                    .padding(.top,10)
                                        VStack{
                                            TextField("大会ホームページのURL", text: $link)
                                                    .foregroundColor(.white)
                                                Divider()
                                                    .background(Color.white)
                                        }
                                    }
                                }

                        HStack{
                                Spacer()
                            Button(action: {
                                    self.showAlert = true
                                    let db = Firestore.firestore()
                                let data: [String : Any] = ["gamename": self.gamename,"year": self.year, "month": self.month, "day": self.day,"place": self.place,"gamevenue": self.gamevenue,"png": self.png,"link": self.link,"groupname": self.managerdata.groupname,"groupnum": self.managerdata.groupnum,"email": self.managerdata.email]         //試合申し込み完了テーブルに入れる
                                        db.collection("gamelist")
                                            .document(self.gamename)
                                            .setData(data)
                                                { (err) in
                                                    if err != nil{
                                                        print((err?.localizedDescription)!)
                                                            return
                                                }
                                            }
                                    }){
                                        Text("登録")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("green2"))
                                            .padding(.vertical)
                                            .padding(.horizontal,45)
                                            .background(Color.white)
                                            .clipShape(Capsule())
                                            
                                    }.alert(isPresented: $showAlert){
                                        Alert(title: Text("登録完了！"),
                                              message: Text("登録が完了しました。内容をご確認下さい。"),
                                              dismissButton: .default(Text("わかりました")))
                                }
                            Spacer()}
                        }
                    }
                }.frame(width: 350, height: 600)
            }
        }
    }
}
        
    

