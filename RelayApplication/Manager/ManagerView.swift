//
//  ManagerView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerView: View {
    @State var createshow = false
    @State var questionshow = false
    @State var makegameshow = false
    @State var approveshow = false
    @State var ordershow = false
    @State var entryshow = false
    @State var gameeditshow = false
    @State var editshow = false

    var body: some View {
    
    VStack{
        ScrollView{
            HStack{
                Image(decorative:"cat4")
                    .resizable()    // 画像サイズをフレームサイズに合わせる
                .frame(width: 120, height: 100)
                Text("大会関係者専用ページ")
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
                            .fill(Color("green1"))
                            .frame(width:170,height: 150)
                    VStack{
                        Image(systemName: "faceid")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.12))
                                                .clipShape(Circle())
                        Text("運営団体情報を")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                        Text("入力する")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    Button(action: {
                                    self.createshow.toggle()
                                }){
                        Text("開く")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .sheet(isPresented: $createshow){
                        ManagerCreateView()
                        }
                    }
                }
            }
                                    
            //ユーザー情報編集
                ZStack{
                    RoundedRectangle(cornerRadius: 20,
                                     style: .continuous)
                        .fill(Color("green2"))
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
                        .frame(width:170,height:60)
                Button(action: {
                                self.questionshow.toggle()
                            }){
                    Text("ページの説明")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .sheet(isPresented: $questionshow){
                                    ManagerQuestion()
                            }
                        }
                    }
                }
            }

            
            
            
            
    //2段目
    HStack{
    //ユーザー情報
        ZStack{
            RoundedRectangle(cornerRadius: 20,
                            style: .continuous)
                .fill(Color("green3"))
                .frame(width:170,height: 150)
        VStack{
            Image(systemName: "pencil")
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.12))
                                    .clipShape(Circle())
            Text("試合を作成する")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width:170,height:60)
                                    
        Button(action: {
                        self.makegameshow.toggle()
                    }){
            Text("開く")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .sheet(isPresented: $makegameshow){
            MakeGameView()
            }
        }
    }
}
                        
                //ユーザー情報編集
    ZStack{
        RoundedRectangle(cornerRadius: 20,
                         style: .continuous)
            .fill(Color("green4"))
            .frame(width:170,height: 150)
    VStack{
        Image(systemName: "hand.thumbsup.fill")
            .foregroundColor(.white)
            .padding()
            .background(Color.white.opacity(0.12))
            .clipShape(Circle())
        Text("エントリーを")
            .fontWeight(.bold)
            .foregroundColor(.white)
                                    
        Text("承認する")
            .fontWeight(.bold)
            .foregroundColor(.white)
                                                    
    Button(action: {
                    self.approveshow.toggle()
                }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $approveshow){
                        ApproveView()
                }
            }
        }
    }
}
            
            
//3段目
    HStack{
//ユーザー情報
        ZStack{
                RoundedRectangle(cornerRadius: 20,
                                style: .continuous)
                    .fill(Color("green7"))
                    .frame(width:170,height: 150)
        VStack{
            Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.white.opacity(0.12))
                                                .clipShape(Circle())
            Text("試合情報を")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            Text("閲覧、編集する")
                    .fontWeight(.bold)
                    .foregroundColor(.white)

        Button(action: {
                        self.gameeditshow.toggle()
                                }){
            Text("開く")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .sheet(isPresented: $gameeditshow){
                    GameEditView()
            }
        }
    }
}
        
//ユーザー情報編集
        ZStack{
            RoundedRectangle(cornerRadius: 20,
                            style: .continuous)
                        .fill(Color("green8"))
                        .frame(width:170,height: 150)
                VStack{
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .clipShape(Circle())
                    Text("運営団体情報を")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                                                
                    Text("閲覧する")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                                                                
                Button(action: {
                                self.editshow.toggle()
                            }){
                    Text("開く")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .sheet(isPresented: $editshow){
                                    ManagerEditView()
                }
            }
        }
    }
}

                        
    //4段目
    HStack{
                //
        ZStack{
            RoundedRectangle(cornerRadius: 20,
                style: .continuous)
                    .fill(Color("green5"))
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
            Text("オーダーリスト")
                .fontWeight(.bold)
                .foregroundColor(.white)
                
        Button(action: {
                    self.ordershow.toggle()
                    }){
            Text("開く")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .sheet(isPresented: $ordershow){
                        OrderListView()
            }
        }
    }
}
    ZStack{
                //
        RoundedRectangle(cornerRadius: 20,
                            style: .continuous)
                .fill(Color("green6"))
                .frame(width:170,height: 150)
    VStack{
        Image(systemName: "book.fill")
            .foregroundColor(.white)
            .padding()
            .background(Color.white.opacity(0.12))
            .clipShape(Circle())
        Text("試合の")
            .fontWeight(.bold)
            .foregroundColor(.white)
        Text("エントリーリスト")
            .fontWeight(.bold)
            .foregroundColor(.white)
    Button(action: {
        self.entryshow.toggle()
                    }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $entryshow){
                EntryListView()
                                }
                            }
                        }
                    }
                }
            }.padding(.top,30)
        }
    }
}



struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
