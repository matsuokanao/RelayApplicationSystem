//
//  ConfirmationView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/29.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ConfirmationView: View {
    
  @ObservedObject var provisionaldata = getProvisionalList()
  @ObservedObject var userdata = getUserdataList()
    
    var body: some View {
        VStack{
            ForEach(self.provisionaldata.data,id: \.id){i in
                ForEach(self.userdata.data,id: \.id){u in
                    
            CellConfirmationView(provisionallist: i, userlist: u)
                }
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}


struct CellConfirmationView: View {
    var provisionallist : provisionallist
    var userlist : userlist
    var body: some View {
        VStack{
            if provisionallist.userpass == userlist.userpass && provisionallist.email == userlist.email{
                Group{
                Text("試合名")
                Text(provisionallist.gamename)
                Text("開催都道府県")
                Text(provisionallist.place)
                Text("試合会場")
                Text(provisionallist.gamevenue)
                Text("名前")
                Text(userlist.username)
                Text("登録陸連")
                Text(userlist.jaaf)
                }
                Text("所属名")
                Text(userlist.belong)
                
                Text("参加種目")
                Text(provisionallist.event1)
                Text(provisionallist.event2)
                Text(provisionallist.event3)


            }
        }
    }
}
