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
        HStack{
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
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}

