//
//  RelayView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayView: View {
    
    @State var show = false
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
                    self.show.toggle()
                        }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
                .sheet(isPresented: $show){
            UserCreateView()
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
                    self.usereditshow.toggle()
                    }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $usereditshow){
                        UserEditView()
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
                    self.diaryshow.toggle()
                        }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $diaryshow){
                        DiaryView()
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
            self.diaryshow.toggle()
            }){
        Text("リレーページの説明")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $diaryshow){
                DiaryView()
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
