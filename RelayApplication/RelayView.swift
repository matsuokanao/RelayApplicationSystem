//
//  RelayView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct RelayView: View {
    @State var index = "Home"
    @State var show = false
    var body: some View {
                  ZStack{
                     
                    (self.show ? Color.black.opacity(0.05) : Color.gray).edgesIgnoringSafeArea(.all)
                     
                     ZStack(alignment: .leading) {
                         
                         VStack(alignment : .leading,spacing: 25){
                             
                             HStack(spacing: 15){
                                 
                                 Image("rancatview")
                                 .resizable()
                                 .frame(width: 65, height: 65)
                                 
                                 VStack(alignment: .leading, spacing: 12) {
                                     
                                     Text("Catherine")
                                         .fontWeight(.bold)
                                     
                                     Text("New York , US")
                                 }
                             }
                             .padding(.bottom, 50)
         
                             
                             ForEach(data,id: \.self){i in
                                 
                                 Button(action: {
                                     
                                     self.index = i
                                     
                                     withAnimation(.spring()){
                                         
                                         self.show.toggle()
                                     }
                                     
                                 }) {
                                     
                                     HStack{
                                         
                                         Capsule()
                                         .fill(self.index == i ? Color.orange : Color.clear)
                                         .frame(width: 5, height: 30)
                                         
                                         Text(i)
                                             .padding(.leading)
                                             .foregroundColor(.black)
                                         
                                     }
                                 }
                             }
                             
                             Spacer()
                         }.padding(.leading)
                         .padding(.top)
                         .scaleEffect(self.show ? 1 : 0)
                         
                         ZStack(alignment: .topTrailing) {
                             
                             MainView(show: self.$show,index: self.$index)
                             .scaleEffect(self.show ? 0.8 : 1)
                             .offset(x: self.show ? 150 : 0,y : self.show ? 50 : 0)
                             .disabled(self.show ? true : false)
                             
                             
                             Button(action: {
                                 
                                 withAnimation(.spring()){
                                     
                                     self.show.toggle()
                                 }
                                 
                             }) {
                                 
                                 Image(systemName: "xmark")
                                 .resizable()
                                 .frame(width: 15, height: 15)
                                 .foregroundColor(.black)
                                 
                             }.padding()
                             .opacity(self.show ? 1 : 0)
                 }
             }
         }
    }
}

struct RelayView_Previews: PreviewProvider {
    static var previews: some View {
        RelayView()
    }
}

struct MainView : View {
    
    @Binding var show : Bool
    @Binding var index : String
    
    var body : some View{
        
        VStack(spacing: 0){
            
            ZStack{
                
                HStack{
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        Image("runcatview")
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("runcatview")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            ZStack{
                
                Home().opacity(self.index == "Home" ? 1 : 0)
                
                Orders().opacity(self.index == "Orders" ? 1 : 0)
                
                Logout().opacity(self.index == "Logout" ? 1 : 0)
                
                SavedCards().opacity(self.index == "Saved Cards" ? 1 : 0)
                
                Settings().opacity(self.index == "Settings" ? 1 : 0)
                
                Help().opacity(self.index == "Help" ? 1 : 0)
            }
            
        }.background(Color.white)
        .cornerRadius(15)
    }
}

struct Home : View {
    
    var body : some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing : 18){
                Text("HOme")
                
                ForEach(1...6,id: \.self){i in
                    
                    Image("p(i)")
                    .resizable()
                    .frame(height: 250)
                    .cornerRadius(20)
                }
            }.padding(.top, 8)
            .padding(.horizontal)
        }
    }
}

struct Orders : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Homescreen()
            }
        }
    }
}

struct Logout : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Button(action: {
                try! Auth.auth().signOut()
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("status"),
                                                        object: nil)
                        
                    }){
                        Text("ログアウト")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 250)
                    }
                    .background(Color("blackcolor"))
                    .cornerRadius(10)
                    .padding(.top, 10)
            }
        }
    }
}

struct SavedCards : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Saved Cards")
            }
        }
    }
}

struct Settings : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Settings")
            }
        }
    }
}

struct Help : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Help")
            }
        }
    }
}


var data = ["Home","Orders","Logout","Saved Cards","Settings","Help"]

 
                
