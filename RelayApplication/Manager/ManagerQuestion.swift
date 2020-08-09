//
//  ManagerQuestion.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerQuestion: View {
    @State var ManagerSelected: Bool = false
    @State var ManagerGameCreateSelected: Bool = false
    @State var ManagerGameFlowSelected: Bool = false
    @State var ManagerGameEndFlowSelected: Bool = false
    @State var ManagerGameEditSelected: Bool = false
    @State var ManagerGameDeleteSelected: Bool = false
    @State var ManagerRelayOrderSelected: Bool = false
    @State var ManagerGameOrderSelected: Bool = false

    var body: some View {
            VStack{
                    ScrollView{
                    VStack{

                    if(self.ManagerSelected == true){
                        ManagerAnswer(ManagerSelected: self.$ManagerSelected)
                        
                    } else if(self.ManagerGameCreateSelected == true){
                        ManagerAnswercreateGame(ManagerGameCreateSelected: self.$ManagerGameCreateSelected)
                        
                    } else if(self.ManagerGameFlowSelected == true){
                        ManagerAnswerGameFlow(ManagerGameFlowSelected: self.$ManagerGameFlowSelected)
                        
                    } else if(self.ManagerGameEndFlowSelected == true){
                        ManagerAnswerGameEndFlow(ManagerGameEndFlowSelected: self.$ManagerGameEndFlowSelected)
                        
                    } else if(self.ManagerGameEditSelected == true){
                        ManagerAnswerGameEdit(ManagerGameEditSelected: self.$ManagerGameEditSelected)
                        
                    } else if(self.ManagerGameDeleteSelected == true){
                        ManagerAnswerDelete(ManagerGameDeleteSelected: self.$ManagerGameDeleteSelected)
                        
                    } else if(self.ManagerRelayOrderSelected == true){
                        ManagerAnswerRelayOrderList(ManagerRelayOrderSelected: self.$ManagerRelayOrderSelected)

                    } else if(self.ManagerGameOrderSelected == true){
                        ManagerAnswerGameEntryList(ManagerGameOrderSelected: self.$ManagerGameOrderSelected)

                    }else {
        VStack{
            Text("大会関係者専用ページ")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title)
            Text("使い方ガイド")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title)
                        }.frame(width:400,height: 100)
                            .background(Color("green2"))

                    
        VStack{
            HStack{
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color("green2"))
                Text("運営団体情報とは？")
                            
                            Spacer()
            Button(action: {
                            self.ManagerSelected.toggle()
                                })  {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("green2"))
                                        }
                                    }.frame(width:300,height: 15)
                                    .padding(.top,20)
                            
                            
                HStack{
                    Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("green2"))
                    Text("試合を作成したい！")
                                            Spacer()
                    Button(action: {
                                    self.ManagerGameCreateSelected.toggle()
                                        })  {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green2"))
                                    }
                            }.frame(width:300,height: 20)
                            .padding(.top,20)

                 
                            
                HStack{
                    Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("green2"))
                    Text("試合を作成をした後の、大会までの流れを知りたい")
                            Spacer()
                Button(action: {
                                self.ManagerGameFlowSelected.toggle()
                                })  {
                    Image(systemName: "play.fill")
                                .foregroundColor(Color("green2"))
                                                }
                                                }.frame(width:300,height: 50)
            
            
                HStack{
                    Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("green2"))
                    Text("大会終了後の流れを知りたい")
                            Spacer()
                Button(action: {
                                self.ManagerGameEndFlowSelected.toggle()
                            })  {
                    Image(systemName: "play.fill")
                            .foregroundColor(Color("green2"))
                                                }
                                                }.frame(width:300,height: 50)
                            
                            
                HStack{
                     Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("green2"))
                            Text("登録した試合情報の内容を変更したい")
                    Spacer()
                    Button(action: {
                            self.ManagerGameEditSelected.toggle()
                        })  {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green2"))
                                            }
                                        }.frame(width:300,height: 50)
                                           

                            
                            
                HStack{
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("green2"))
                    Text("登録した試合を削除したい")
                            Spacer()
                Button(action: {
                                self.ManagerGameDeleteSelected.toggle()
                            })  {
                    Image(systemName: "play.fill")
                                .foregroundColor(Color("green2"))
                                        }
                                    }.frame(width:300,height: 55)
                                                   
                            
                HStack{
                    Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("green2"))
                    Text("リレーのオーダーリストについて知りたい")
                        Spacer()
                Button(action: {
                                self.ManagerRelayOrderSelected.toggle()
                            })  {
                    Image(systemName: "play.fill")
                            .foregroundColor(Color("green2"))
                                            }
                                        }.frame(width:300,height: 55)
                            
                            
                HStack{
                     Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("green2"))
                            Text("試合のエントリーリストについて知りたい")
                    Spacer()
                Button(action: {
                            self.ManagerGameOrderSelected.toggle()
                        })  {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green2"))
                                        }
                                    }.frame(width:300,height: 55)
                                    }
                                }
                            }
                        }
                    }
                }
            }

struct ManagerQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ManagerQuestion()
    }
}
