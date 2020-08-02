//
//  RelayView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayView: View {
    
    @State var applicationshow = false
    @State var ordershow = false
    @State var listshow = false
    @State var questionshow = false
    @State var usereditshow = false
    @State var diaryshow = false
    
    var body: some View {
        VStack{
        ScrollView{
            HStack{
                Text("リレー")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("blackcolor"))
                                
                    Spacer(minLength: 0)
                }
                    .padding(.horizontal)
                            
    //1段目
    HStack{
    //ユーザー情報
        ZStack{
            RoundedRectangle(cornerRadius: 20,
                            style: .continuous)
                .fill(Color("yello1"))
                .frame(width:170,height: 150)
    VStack{
        Image(systemName: "flame.fill")
            .foregroundColor(.white)
            .padding()
            .background(Color.white.opacity(0.12))
            .clipShape(Circle())
        Text("リレーに")
            .fontWeight(.bold)
            .foregroundColor(.white)
        Text("エントリーする")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width:140,height:30)

                                        
    Button(action: {
                    self.applicationshow.toggle()
                        }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
                .sheet(isPresented: $applicationshow){
            RelayApplicationView()
            }
        }
    }
}
                            
                    //ユーザー情報編集
    ZStack{
        RoundedRectangle(cornerRadius: 20,
                        style: .continuous)
            .fill(Color("yello2"))
            .frame(width:170,height: 150)
    VStack{
        Image(systemName: "book.fill")
            .foregroundColor(.white)
            .padding()
            .background(Color.white.opacity(0.12))
            .clipShape(Circle())
        Text("リレーオーダー表")
            .fontWeight(.bold)
            .foregroundColor(.white)
        Text("提出する")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width:140,height:30)

                                        
    Button(action: {
                    self.ordershow.toggle()
                    }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $ordershow){
                        RelayOrderView()
                }
            }
        }
    }
}
                            
    //2段目
    HStack{
    //
        ZStack{
            RoundedRectangle(cornerRadius: 20,
                style: .continuous)
                    .fill(Color("yello3"))
                    .frame(width:170,height: 150)
        VStack{
            Image(systemName: "person.3.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.12))
                .clipShape(Circle())
            Text("リレーの")
            .fontWeight(.bold)
            .foregroundColor(.white)
            Text("申し込みリスト")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width:140,height:30)

    Button(action: {
                    self.listshow.toggle()
                        }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $listshow){
                        RelayListView()
            }
        }
    }
}
        
    ZStack{
    //
        RoundedRectangle(cornerRadius: 20,
                         style: .continuous)
            .fill(Color("yello4"))
            .frame(width:170,height: 150)
            .frame(width:170,height: 150)
        VStack{
            Image(systemName: "questionmark.circle.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.12))
                            .clipShape(Circle())
        Text("分からない事がありますか？")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width:140,height:50)
    Button(action: {
            self.questionshow.toggle()
            }){
        Text("リレーページの説明")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $questionshow){
                RelayQuestionView()
                                }
                            }
                        }
                    }
                }
            }.padding(.top,30)
        }
    }
}

struct RelayView_Previews: PreviewProvider {
    static var previews: some View {
        RelayView()
    }
}
