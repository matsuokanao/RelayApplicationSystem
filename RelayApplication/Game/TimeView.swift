//
//  TimeView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct TimeView: View {
    
    @State var timeshow = false
    @State var diaryfinishshow = false
    
    //日記内容
    @State var diary = ""
    //日付　年
    @State var year = ""
    //日付　月
    @State var month = ""
    //日付　日
    @State var day = ""
    //天気
    @State var weather = ""
    //気持ち
    @State var mental = ""
    //大会名
    @State var tournamentname = ""
    //記録
    @State var time = ""
    //種目
    @State var event = ""
    @State var email = ""
    @State var userpass = ""
    @State var showAlert = false
    @State var FshowAlert = false
    @State var title = ""
    @State var message = ""
    @State var dismissButton = ""
    @ObservedObject var keyboard = KeyboardObserver()
    
    var body: some View {
        VStack{
            VStack{
                Text("今日の試合はどうでしたか？")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("思った事を書き出してみましょう")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.frame(width:500,height: 100)
                .background(Color("blue3"))
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(Color("blue3"))
                        Text("日付")
                        Spacer()
                        Button(action: {
                            self.timeshow.toggle()
                        }) {
                            Text("試合一覧")
                                .padding(.vertical)
                                .frame(width: 100,height: 30)
                                .sheet(isPresented: $timeshow){
                                    TimeListView()
                            }
                        }.background(Color("blue3"))
                            .foregroundColor(.white)
                        
                    }
                    HStack{
                        TextField("", text: self.$year)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("blue3"))
                        Text("年")
                        
                        TextField("", text: self.$month)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("blue3"))
                        Text("月")
                        
                        TextField("", text: self.$day)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("blue3"))
                        Text("日")
                    }
                    HStack{
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(Color("blue3"))
                        Text("天気")
                        TextField("", text: self.$weather)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("blue3"))
                        
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color("blue3"))
                        Text("気持ち")
                        TextField("", text: self.$mental)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("blue3"))
                    }
                    HStack{
                        Image(systemName: "hare.fill")
                            .foregroundColor(Color("blue3"))
                        Text("出場種目")
                    }
                    
                    
                    VStack{
                        TextField("", text: self.$event)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("blue3"))
                    }
                    
                    HStack{
                        Image(systemName: "timer")
                            .foregroundColor(Color("blue3"))
                        Text("記録")
                    }
                    
                    Group{
                        VStack{
                            TextField("", text: self.$time)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .background(Color("blue3"))
                        }
                        
                        
                        HStack{
                            Image(systemName: "sparkles")
                                .foregroundColor(Color("blue3"))
                            Text("項目（大会名や題名など）")
                        }
                        
                        
                        VStack{
                            TextField("", text: self.$tournamentname)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .background(Color("blue3"))
                        }
                    }
                    
                    HStack{
                        Image(systemName: "book.fill")
                            .foregroundColor(Color("blue3"))
                        Text("気持ち")
                    }
                    VStack{
                        MultilineTextField(text: self.$diary)
                            .frame(height: 300)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black))
                    }
                    
                    Group{
                        HStack{
                            Image(systemName: "sparkles")
                                .foregroundColor(Color("blue3"))
                            Text("メールアドレス")
                        }
                        
                        
                        VStack{
                            TextField("", text: self.$email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .background(Color("blue3"))
                        }
                        
                        HStack{
                            Image(systemName: "sparkles")
                                .foregroundColor(Color("blue3"))
                            Text("ユーザーパス")
                        }
                        
                        
                        VStack{
                            TextField("", text: self.$userpass)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .background(Color("blue3"))
                        }
                        HStack{
                            Spacer()
                            Button(action: {
                                if self.diary == "" || self.email == "" || self.userpass == "" || self.year == "" || self.month == "" || self.day == "" || self.weather == "" || self.mental == "" || self.tournamentname == "" || self.time == "" || self.event == ""{
                                    self.showAlert.toggle()
                                    self.title = "エラー"
                                    self.message = "メールアドレス、ユーザーパスを入力して下さい。"
                                    self.dismissButton = "OK"
                                }else{
                                    self.showAlert = true
                                    let db = Firestore.firestore()
                                    let data: [String : Any] = ["diary": self.diary, "year": self.year, "month": self.month, "day": self.day, "weather": self.weather, "mental": self.mental, "tournamentname": self.tournamentname,"email": self.email,"userpass": self.userpass,"event": self.event,"time":self.time]
                                    
                                    db.collection("timelist")
                                        .addDocument(data:data)
                                        { (err) in
                                            if err != nil{
                                                print((err?.localizedDescription)!)
                                                return
                                            }
                                    }
                                }
                            }){
                                Text("登録する")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding(.vertical)
                                    .padding(.horizontal,45)
                                    .background(Color("blue3"))
                                    .clipShape(Capsule())
                                
                            }.alert(isPresented: $showAlert){
                                Alert(title: Text("保存完了！"),
                                      message: Text("内容を保存しました。"),
                                      dismissButton: .default(Text("わかりました")))
                                
                            }
                            Spacer()
                        }
                    }
                }
            }.onAppear{
                self.keyboard.startObserve()
            }.onDisappear{
                self.keyboard.stopObserve()
            }.padding(.bottom, keyboard.keyboardHeight)
        }.frame(width: 300, height: 600)
    }
}




struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
