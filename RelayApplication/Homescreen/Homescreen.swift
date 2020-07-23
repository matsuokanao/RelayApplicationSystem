//
//  RelayView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct Homescreen: View {
    @State var show = false
    
    var body: some View {
        VStack{
            HStack{
            Text("HOME")
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
                .fill(Color.red)
                .frame(width:170,height: 150)
                VStack{
                    Image(systemName: "faceid")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .clipShape(Circle())
                        
        Button(action: {
            self.show.toggle()
        }){
            Text("ユーザー情報")
                .fontWeight(.bold)
                .foregroundColor(.white)
            .sheet(isPresented: $show){
            UserCreate()
                    }
                }
            }
        }
            
            //
            ZStack{
                RoundedRectangle(cornerRadius: 20,
                                 style: .continuous)
                    .fill(Color.red)
                    .frame(width:170,height: 150)
            Button(action: {
                self.show.toggle()
            }){
                Text("aa")
                .sheet(isPresented: $show){
                UserCreate()
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
                    .fill(Color.red)
                    .frame(width:170,height: 150)
            Button(action: {
                self.show.toggle()
            }){
                Text("aa")
                .sheet(isPresented: $show){
                UserCreate()
                        }
                    }
                }
                ZStack{
                    //
                    RoundedRectangle(cornerRadius: 20,
                                     style: .continuous)
                        .fill(Color.red)
                        .frame(width:170,height: 150)
                Button(action: {
                    self.show.toggle()
                }){
                    Text("aa")
                    .sheet(isPresented: $show){
                    UserCreate()
                            }
                    }
                }
            }.padding(.top,30)
        }
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}

