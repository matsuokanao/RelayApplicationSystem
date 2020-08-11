//
//  RelayQuestionView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayQuestionView: View {
    
    @State var RelayApplicationSelected: Bool = false
    @State var RelayApplicationShowSelected: Bool = false
    @State var RelayFinishSelected: Bool = false
    @State var RelayWhoSelected: Bool = false
    @State var RelayOrderSelected: Bool = false
    @State var RelayApplicationEditSelected: Bool = false
    @State var RelayOrderEditSelected: Bool = false
    @State var RelayEndSelected: Bool = false

    var body: some View {
        VStack{
                ScrollView{
                VStack{

                if(self.RelayApplicationSelected == true){
                    RelayAnswerApplication(RelayApplicationSelected: self.$RelayApplicationSelected)
                    
                } else if(self.RelayApplicationShowSelected == true){
                    RelayAnsweApplicationShow(RelayApplicationShowSelected: self.$RelayApplicationShowSelected)
                    
                } else if(self.RelayFinishSelected == true){
                    RelayAnswerApplicationFinish(RelayFinishSelected: self.$RelayFinishSelected)
                    
                } else if(self.RelayWhoSelected == true){
                    RelayAnswerApplicationWho(RelayWhoSelected: self.$RelayWhoSelected)
                    
                } else if(self.RelayOrderSelected == true){
                    RelayAnswerApplicationOrder(RelayOrderSelected: self.$RelayOrderSelected)
                    
                } else if(self.RelayApplicationEditSelected == true){
                    RelayAnswerApplicationEdit(RelayApplicationEditSelected: self.$RelayApplicationEditSelected)
                    
                } else if(self.RelayOrderEditSelected == true){
                    RelayAnswerApplicationOrderEdit(RelayOrderEditSelected: self.$RelayOrderEditSelected)
                
                } else if(self.RelayEndSelected == true){
                    RelayAnswerApplicationEnd(RelayEndSelected: self.$RelayEndSelected)

                }else {
    VStack{
        Text("リレーページ")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.title)
        Text("使い方ガイド")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.title)
                    }.frame(width:400,height: 200)
                        .background(Color("yello4"))

                
    VStack{
        HStack{
            Image(systemName: "lightbulb.fill")
                .foregroundColor(Color("yello4"))
            Text("リレーに申し込みたい!")
                        
                        Spacer()
        Button(action: {
                        self.RelayApplicationSelected.toggle()
                            })  {
            Image(systemName: "play.fill")
                .foregroundColor(Color("yello4"))
                                    }
                                }.frame(width:300,height: 15)
                                .padding(.top,20)
                        
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("yello4"))
                Text("申し込み中のリレーを見たい")
                                        Spacer()
                Button(action: {
                                self.RelayApplicationShowSelected.toggle()
                                    })  {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("yello4"))
                                }
                        }.frame(width:300,height: 20)
                        .padding(.top,20)

             
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("yello4"))
                Text("エントリーが完了するには？")
                        Spacer()
            Button(action: {
                            self.RelayFinishSelected.toggle()
                            })  {
                Image(systemName: "play.fill")
                            .foregroundColor(Color("yello4"))
                                            }
                                            }.frame(width:300,height: 15)
                                                .padding(.top,25)
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("yello4"))
                Text("リレーオーダー表は誰が提出するの？")
                        Spacer()
            Button(action: {
                            self.RelayWhoSelected.toggle()
                        })  {
                Image(systemName: "play.fill")
                        .foregroundColor(Color("yello4"))
                                            }
                                            }.frame(width:300,height: 50)
                        
                        
            HStack{
                 Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color("yello4"))
                        Text("リレーオーダー表を提出したい!")
                Spacer()
                Button(action: {
                        self.RelayOrderSelected.toggle()
                    })  {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("yello4"))
                                        }
                                    }.frame(width:300,height: 50)
                                       

                        
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color("yello4"))
                Text("リレー申し込み後、内容に不備を見つけた")
                        Spacer()
            Button(action: {
                            self.RelayApplicationEditSelected.toggle()
                        })  {
                Image(systemName: "play.fill")
                            .foregroundColor(Color("yello4"))
                                    }
                                }.frame(width:300,height: 55)
                                               
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("yello4"))
                Text("提出したリレーオーダー表に不備を見つけた")
                    Spacer()
            Button(action: {
                            self.RelayOrderEditSelected.toggle()
                        })  {
                Image(systemName: "play.fill")
                        .foregroundColor(Color("yello4"))
                                        }
                                    }.frame(width:300,height: 55)
                        
                        
            HStack{
                 Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color("yello4"))
                        Text("終了した試合を申込みリストから外したい")
                Spacer()
            Button(action: {
                        self.RelayEndSelected.toggle()
                    })  {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("yello4"))
                                    }
                                }.frame(width:300,height: 55)
                                }
                            }
                        }
                    }
                }
            }
        }

struct RelayQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        RelayQuestionView()
    }
}
